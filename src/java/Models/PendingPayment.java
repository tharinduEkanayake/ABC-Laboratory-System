
package Models;

/**
 *
 * @author Tharindu Konesh
 */
public class PendingPayment {
    private int test_report_id;
    private int a_id;
    private String t_name;
    private double charges;

    public PendingPayment(int test_report_id, int a_id, String t_name, double charges) {
        this.test_report_id = test_report_id;
        this.a_id = a_id;
        this.t_name = t_name;
        this.charges = charges;
    }

    public int getTest_report_id() {
        return test_report_id;
    }

    public void setTest_report_id(int test_report_id) {
        this.test_report_id = test_report_id;
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

    public double getCharges() {
        return charges;
    }

    public void setCharges(double charges) {
        this.charges = charges;
    }
}
