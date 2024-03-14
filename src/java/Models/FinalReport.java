
package Models;

/**
 *
 * @author Tharindu Konesh
 */
public class FinalReport {
    private String tr_time;
    private String t_report_data;
    private String t_name;
    private String references_level;
    private String a_date;
    private String a_time;
    private String p_name;
    private String p_gender;
    private String p_email;
    private String p_phone;
    private String ref_by;

    public String getRef_by() {
        return ref_by;
    }

    public void setRef_by(String ref_by) {
        this.ref_by = ref_by;
    }

    public FinalReport() {
    }
    

    public FinalReport(String tr_time, String t_report_data, String t_name, String references_level, String a_date, String a_time, String p_name, String p_gender, String p_email, String p_phone) {
        this.tr_time = tr_time;
        this.t_report_data = t_report_data;
        this.t_name = t_name;
        this.references_level = references_level;
        this.a_date = a_date;
        this.a_time = a_time;
        this.p_name = p_name;
        this.p_gender = p_gender;
        this.p_email = p_email;
        this.p_phone = p_phone;
    }

    public String getTr_time() {
        return tr_time;
    }

    public void setTr_time(String tr_time) {
        this.tr_time = tr_time;
    }

    public String getT_report_data() {
        return t_report_data;
    }

    public void setT_report_data(String t_report_data) {
        this.t_report_data = t_report_data;
    }

    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
    }

    public String getReferences_level() {
        return references_level;
    }

    public void setReferences_level(String references_level) {
        this.references_level = references_level;
    }

    public String getA_date() {
        return a_date;
    }

    public void setA_date(String a_date) {
        this.a_date = a_date;
    }

    public String getA_time() {
        return a_time;
    }

    public void setA_time(String a_time) {
        this.a_time = a_time;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_gender() {
        return p_gender;
    }

    public void setP_gender(String p_gender) {
        this.p_gender = p_gender;
    }

    public String getP_email() {
        return p_email;
    }

    public void setP_email(String p_email) {
        this.p_email = p_email;
    }

    public String getP_phone() {
        return p_phone;
    }

    public void setP_phone(String p_phone) {
        this.p_phone = p_phone;
    }
}
