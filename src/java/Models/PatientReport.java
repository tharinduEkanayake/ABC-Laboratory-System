
package Models;

/**
 *
 * @author Tharindu Konesh
 */
public class PatientReport {
    private int a_id;
    private String t_name;
    private String t_date;
    private String r_data;
    private int tr_id;

    public PatientReport(int a_id, String t_name, String t_date, String r_data, int tr_id) {
        this.a_id = a_id;
        this.t_name = t_name;
        this.t_date = t_date;
        this.r_data = r_data;
        this.tr_id = tr_id;
    }

    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
    }

    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
    }

    public String getT_date() {
        return t_date;
    }

    public void setT_date(String t_date) {
        this.t_date = t_date;
    }

    public String getR_data() {
        return r_data;
    }

    public void setR_data(String r_data) {
        this.r_data = r_data;
    }

    public int getTr_id() {
        return tr_id;
    }

    public void setTr_id(int tr_id) {
        this.tr_id = tr_id;
    }

    
    
}
