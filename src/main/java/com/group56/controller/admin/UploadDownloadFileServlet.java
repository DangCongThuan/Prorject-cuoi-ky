package com.group56.controller.admin;

import com.group56.model.ProductModel;
import com.group56.service.IProductImgService;
import com.group56.service.IProductService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.StringUtils;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "UploadDownloadFileServlet", value = "/UploadDownloadFileServlet")
public class UploadDownloadFileServlet extends HttpServlet {
    @Inject
    IProductService productService;
    @Inject
    IProductImgService productImgService;
    private ServletFileUpload uploader = null;

    @Override
    public void init() throws ServletException {
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
        fileFactory.setRepository(filesDir);
        this.uploader = new ServletFileUpload(fileFactory);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String fileName = request.getParameter("fileName");
        if (fileName == null || fileName.equals("")) {
            throw new ServletException("File Name can't be null or empty");
        }
        File file = new File(request.getServletContext().getAttribute("FILES_DIR") + File.separator + fileName);
        if (!file.exists()) {
            throw new ServletException("File doesn't exists on server.");
        }
//        response.sendRedirect("/lab7/manage/upload/"+fileName);
        System.out.println("File location on server::" + file.getAbsolutePath());
        ServletContext ctx = getServletContext();
        InputStream fis = new FileInputStream(file);
        String mimeType = ctx.getMimeType(file.getAbsolutePath());
        response.setContentType(mimeType != null ? mimeType : "application/octet-stream");
        response.setContentLength((int) file.length());
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

        ServletOutputStream os = response.getOutputStream();
        response.setContentType("image/jpeg");
        byte[] bufferData = new byte[1024];
        int read = 0;
        while ((read = fis.read(bufferData)) != -1) {
            os.write(bufferData, 0, read);
        }
        os.flush();
        os.close();
        fis.close();
        System.out.println("File downloaded at client successfully");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductModel productModel = new ProductModel();
        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new ServletException("Content type is not multipart/form-data");
        }
        try {
            List<FileItem> fileItemsList = uploader.parseRequest(request);
            Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
            Hashtable params = new Hashtable<>();
            String thumbnail = "";
            ArrayList<String> arrayList = new ArrayList<>();
            while (fileItemsIterator.hasNext()) {
                FileItem fileItem = fileItemsIterator.next();
                if (fileItem.isFormField()) {
                    params.put(fileItem.getFieldName(), fileItem.getString());
                } else {
                    try {
                        if (StringUtils.isBlank(fileItem.getName())) {
                            fileItem.delete();
                            continue;
                        }
                        if (fileItem.getFieldName().equals("thumbnail[]")) {
                            thumbnail = fileItem.getName();
                        } else if (fileItem.getFieldName().equals("infor[]")) {
                            arrayList.add(fileItem.getName());
                        }
                        System.out.println("FieldName=" + fileItem.getFieldName());
                        System.out.println("FileName=" + fileItem.getName());
                        System.out.println("ContentType=" + fileItem.getContentType());
                        System.out.println("Size in bytes=" + fileItem.getSize());
                        File file = new File(request.getServletContext().getAttribute("FILES_DIR") + File.separator + fileItem.getName());
                        if (!file.exists()) {
                        fileItem.write(file);
                        }
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                }
            }
            String id = (String) params.get("id");
            if (!StringUtils.isAllBlank(id, thumbnail)) {
                productModel = productService.findById(Long.parseLong(id));
                productModel.setThumbnail(thumbnail);
                productModel.setInforExtra(arrayList);
                productModel.setModifiedBy(productModel.getCreatedBy());
                productService.update(productModel);
                if (productModel.getInforExtra().size() > 0) {
                    System.out.println(productModel.getInforExtra().size());
                    productImgService.add(productModel, "Thông tin Sản phẩm");
                }

            }
        } catch (FileUploadException e) {
            System.out.println(e.getMessage());
        } catch (Exception e) {
            response.sendRedirect("/admin-san-pham?typeAction=edit&message=error_system");
        }
        response.sendRedirect("/admin-san-pham?typeAction=edit&message=insert_success");
    }
}


