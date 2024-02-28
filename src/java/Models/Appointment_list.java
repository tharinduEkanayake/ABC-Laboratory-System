/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Tharindu Konesh
 */
public class Appointment_list {
    private int a_id;
    private String a_date;
    private String register_date;
    private char is_cencelled;
    private String a_status;
    private int patient_id;

    public Appointment_list(String a_date, String register_date, char is_cencelled, String a_status, int patient_id) {
        this.a_date = a_date;
        this.register_date = register_date;
        this.is_cencelled = is_cencelled;
        this.a_status = a_status;
        this.patient_id = patient_id;
    }

    public Appointment_list(int a_id, String a_date, String register_date, char is_cencelled, String a_status, int patient_id) {
        this.a_id = a_id;
        this.a_date = a_date;
        this.register_date = register_date;
        this.is_cencelled = is_cencelled;
        this.a_status = a_status;
        this.patient_id = patient_id;
    }

    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
    }

    public String getA_date() {
        return a_date;
    }

    public void setA_date(String a_date) {
        this.a_date = a_date;
    }

    public String getRegister_date() {
        return register_date;
    }

    public void setRegister_date(String register_date) {
        this.register_date = register_date;
    }

    public char getIs_cencelled() {
        return is_cencelled;
    }

    public void setIs_cencelled(char is_cencelled) {
        this.is_cencelled = is_cencelled;
    }

    public String getA_status() {
        return a_status;
    }

    public void setA_status(String a_status) {
        this.a_status = a_status;
    }

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }
    
}
