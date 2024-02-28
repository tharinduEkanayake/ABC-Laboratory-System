/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Tharindu Konesh
 */
public class Payment {
    private int pay_id;
    private double total_value;
    private String pay_method;
    private String pay_date;
    private String pay_status;
    private int appointment_id;

    public Payment(double total_value, String pay_method, String pay_date, String pay_status, int appointment_id) {
        this.total_value = total_value;
        this.pay_method = pay_method;
        this.pay_date = pay_date;
        this.pay_status = pay_status;
        this.appointment_id = appointment_id;
    }

    public Payment(int pay_id, double total_value, String pay_method, String pay_date, String pay_status, int appointment_id) {
        this.pay_id = pay_id;
        this.total_value = total_value;
        this.pay_method = pay_method;
        this.pay_date = pay_date;
        this.pay_status = pay_status;
        this.appointment_id = appointment_id;
    }

    public int getPay_id() {
        return pay_id;
    }

    public void setPay_id(int pay_id) {
        this.pay_id = pay_id;
    }

    public double getTotal_value() {
        return total_value;
    }

    public void setTotal_value(double total_value) {
        this.total_value = total_value;
    }

    public String getPay_method() {
        return pay_method;
    }

    public void setPay_method(String pay_method) {
        this.pay_method = pay_method;
    }

    public String getPay_date() {
        return pay_date;
    }

    public void setPay_date(String pay_date) {
        this.pay_date = pay_date;
    }

    public String getPay_status() {
        return pay_status;
    }

    public void setPay_status(String pay_status) {
        this.pay_status = pay_status;
    }

    public int getAppointment_id() {
        return appointment_id;
    }

    public void setAppointment_id(int appointment_id) {
        this.appointment_id = appointment_id;
    }
}
