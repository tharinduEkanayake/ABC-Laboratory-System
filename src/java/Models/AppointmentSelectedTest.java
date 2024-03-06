
package Models;

/**
 *
 * @author Tharindu Konesh
 */
public class AppointmentSelectedTest {
    private int test_repo_id;
    private String t_name;
    private String tr_time;
    private String t_report_data;
    private int technician_id;

    public AppointmentSelectedTest(int test_repo_id, String t_name, String tr_time, String t_report_data, int technician_id) {
        this.test_repo_id = test_repo_id;
        this.t_name = t_name;
        this.tr_time = tr_time;
        this.t_report_data = t_report_data;
        this.technician_id = technician_id;
    }

    public int getTest_repo_id() {
        return test_repo_id;
    }

    public void setTest_repo_id(int test_repo_id) {
        this.test_repo_id = test_repo_id;
    }

    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
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

    public int getTechnician_id() {
        return technician_id;
    }

    public void setTechnician_id(int technician_id) {
        this.technician_id = technician_id;
    }
}
