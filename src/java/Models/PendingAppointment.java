
package Models;

/**
 *
 * @author Tharindu Konesh
 */
public class PendingAppointment {
    private int test_repo_id;
    private int appointment_id;
    private int patient_id;
    private String p_name;
    private String t_name;

    public PendingAppointment(int test_repo_id, int appointment, int patient_id, String p_name, String t_name) {
        this.test_repo_id = test_repo_id;
        this.appointment_id = appointment;
        this.patient_id = patient_id;
        this.p_name = p_name;
        this.t_name = t_name;
    }

    public int getTest_repo_id() {
        return test_repo_id;
    }

    public void setTest_repo_id(int test_repo_id) {
        this.test_repo_id = test_repo_id;
    }

    public int getAppointment_id() {
        return appointment_id;
    }

    public void setAppointment_id(int appointment_id) {
        this.appointment_id = appointment_id;
    }

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
    }
}
