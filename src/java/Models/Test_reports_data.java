/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Tharindu Konesh
 */
public class Test_reports_data {
    private int test_repo_id;
    private String tr_time;
    private String t_report_data;
    private String t_report_status;
    private String is_cancelled;
    private int technician_id;
    private int appointment_id;
    private int test_id;

    public Test_reports_data(String tr_time, String t_report_data, String t_report_status, String is_cancelled, int technician_id, int appointment_id, int test_id) {
        this.tr_time = tr_time;
        this.t_report_data = t_report_data;
        this.t_report_status = t_report_status;
        this.is_cancelled = is_cancelled;
        this.technician_id = technician_id;
        this.appointment_id = appointment_id;
        this.test_id = test_id;
    }

    public Test_reports_data(int test_repo_id, String tr_time, String t_report_data, String t_report_status, String is_cancelled, int technician_id, int appointment_id, int test_id) {
        this.test_repo_id = test_repo_id;
        this.tr_time = tr_time;
        this.t_report_data = t_report_data;
        this.t_report_status = t_report_status;
        this.is_cancelled = is_cancelled;
        this.technician_id = technician_id;
        this.appointment_id = appointment_id;
        this.test_id = test_id;
    }

    public int getTest_repo_id() {
        return test_repo_id;
    }

    public void setTest_repo_id(int test_repo_id) {
        this.test_repo_id = test_repo_id;
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

    public String getT_report_status() {
        return t_report_status;
    }

    public void setT_report_status(String t_report_status) {
        this.t_report_status = t_report_status;
    }

    public String getIs_cancelled() {
        return is_cancelled;
    }

    public void setIs_cancelled(String is_cancelled) {
        this.is_cancelled = is_cancelled;
    }

    public int getTechnician_id() {
        return technician_id;
    }

    public void setTechnician_id(int technician_id) {
        this.technician_id = technician_id;
    }

    public int getAppointment_id() {
        return appointment_id;
    }

    public void setAppointment_id(int appointment_id) {
        this.appointment_id = appointment_id;
    }

    public int getTest_id() {
        return test_id;
    }

    public void setTest_id(int test_id) {
        this.test_id = test_id;
    }
}
