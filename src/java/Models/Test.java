/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Tharindu Konesh
 */
public class Test {
    private int t_id;
    private String t_name;
    private double charges;
    private String references_level;
    private char is_deleted;

    public Test(int t_id, String t_name, double charges, String references_level, char is_deleted) {
        this.t_id = t_id;
        this.t_name = t_name;
        this.charges = charges;
        this.references_level = references_level;
        this.is_deleted = is_deleted;
    }

    public Test(String t_name, double charges, String references_level, char is_deleted) {
        this.t_name = t_name;
        this.charges = charges;
        this.references_level = references_level;
        this.is_deleted = is_deleted;
    }
    
    public int getT_id() {
        return t_id;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
    }

    public double getCharges() {
        return charges;
    }

    public void setCharges(double charges) {
        this.charges = charges;
    }

    public String getReferences_level() {
        return references_level;
    }

    public void setReferences_level(String references_level) {
        this.references_level = references_level;
    }

    public char getIs_deleted() {
        return is_deleted;
    }

    public void setIs_deleted(char is_deleted) {
        this.is_deleted = is_deleted;
    }

    
    
}
