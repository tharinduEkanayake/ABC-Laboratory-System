package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfCell;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.pdf.draw.LineSeparator;
import java.io.IOException;

/**
 *
 * @author Tharindu Konesh
 */
@WebServlet(name = "PDFGenarator", urlPatterns = {"/PDFGenarator"})
public class PDFGenarator extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        CreatePDF(request,response);
        getPDF(request, response);
        
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void getPDF(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        int tr_id = Integer.parseInt(request.getParameter("id"));
        
        var report_data = DBUtil.getFinalReportData(tr_id);
        
        String p_name = report_data.getP_name();
        String p_gender = report_data.getP_gender();
        String p_email = report_data.getP_email();
        String phone = report_data.getP_phone();
        
        String a_date = report_data.getA_date();
        String a_time = report_data.getA_time();
        String t_time = report_data.getTr_time();
        String ref_by = report_data.getRef_by();
        
        String t_name = report_data.getT_name();
        String t_result = report_data.getT_report_data();
        String r_level = report_data.getReferences_level();
        
        //create array of referrence level items
        String[] r_level_item = r_level.split(",");
        
        
        
        
        
        
        
        
        
        
        
        

        Rectangle pageSize = new Rectangle(PageSize.A4);
        Document document = new Document(pageSize);

        try {
            // Set content headers for download
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=Test_Report.pdf");

            PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            Font headingFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 19);

            Paragraph title = new Paragraph("ABC Laboratories", headingFont);
            title.setAlignment(Element.ALIGN_CENTER); // Center alignment  

            Paragraph subTitle = new Paragraph("12/A Main Street, Kurunegala | Phone: (+94) 365-8745 | Email: info@abclabs.com");
            subTitle.setAlignment(Element.ALIGN_CENTER);

            document.add(title);
            document.add(subTitle);
            document.add(new Chunk(new LineSeparator()));

            document.add(new Paragraph(" "));

            //table properties
            PdfPTable mainDetails = new PdfPTable(2);
            mainDetails.setWidthPercentage(100);

            mainDetails.getDefaultCell().setBorder(PdfCell.NO_BORDER);
            mainDetails.getDefaultCell().setMinimumHeight(20);

            PdfPCell header1 = new PdfPCell(new Phrase(""));
            header1.setHorizontalAlignment(Element.ALIGN_CENTER);
            header1.setBorder(PdfCell.NO_BORDER);

            PdfPCell header2 = new PdfPCell(new Phrase(""));
            header2.setHorizontalAlignment(Element.ALIGN_CENTER);
            header2.setBorder(PdfCell.NO_BORDER);

            mainDetails.addCell(header1);
            mainDetails.addCell(header2);

            //data rows
            mainDetails.addCell("Name       :  " + p_name);
            mainDetails.addCell("Appointment Date   :  " + a_date);

            mainDetails.addCell("Gender     :  " + p_gender);
            mainDetails.addCell("Appointmnet Time   :  " + a_time);

            mainDetails.addCell("Email      :  " + p_email);
            mainDetails.addCell("Test Time          :  " + t_time);

            mainDetails.addCell("Phone No   :  " + phone);
            mainDetails.addCell("Referred By         :  " + ref_by);

            mainDetails.addCell("");
            mainDetails.addCell("");

            mainDetails.addCell("");
            mainDetails.addCell("");

            document.add(mainDetails);

            // test report data
            document.add(new Chunk(new LineSeparator()));
            document.add(new Paragraph("Test Name                                                         " + "Test Result"));
            document.add(new Chunk(new LineSeparator()));
            document.add(new Paragraph(t_name + "                                                                    " + t_result));

            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));
            

            document.add(new Paragraph(""));            
            for(String item : r_level_item){
                document.add(new Paragraph(item));
            }
            
//            document.add(new Paragraph("Low Range 0 - 50"));
//            document.add(new Paragraph("Normal Range 50 - 100"));
//            document.add(new Paragraph("Higher Range  above 100"));

        } catch (DocumentException de) {
            System.err.println(de.getMessage());
        } finally {
            document.close();
            response.getOutputStream().close();
        }

    }

//    protected void CreatePDF(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        Document document = new Document();
//
//        try {
//            // Set content headers for download
//            response.setContentType("application/pdf");
//            response.setHeader("Content-Disposition", "attachment; filename=HelloWorld.pdf");
//
//            PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
//            document.open();
//
//            Font headingFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 19);
//            // 1. Create header elements (e.g., text, image)
//            Paragraph title = new Paragraph("ABC Laboratories", headingFont);
//            title.setAlignment(Element.ALIGN_CENTER); // Center alignment  
//
//            Paragraph subTitle = new Paragraph("12/A Main Street, Kurunegala | Phone: (+94) 365-8745 | Email: info@abclabs.com");
//            subTitle.setAlignment(Element.ALIGN_CENTER);
//
//            document.add(title);
//            document.add(subTitle);
//            document.add(new Chunk(new LineSeparator()));
//
//            // 4. Add some space between header and content (optional)
//            document.add(new Paragraph(" "));
//
//            document.add(new Paragraph("Hello World"));
//        } catch (DocumentException de) {
//            System.err.println(de.getMessage());
//        } finally {
//            document.close();
//            response.getOutputStream().close();
//        }
//
//    }

}
