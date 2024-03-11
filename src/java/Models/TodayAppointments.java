
package Models;

/**
 *
 * @author Tharindu Konesh
 */
public class TodayAppointments {
    private int totalAppointments ;

    public TodayAppointments() {
    }

    public TodayAppointments(int totalAppointments) {
        this.totalAppointments = totalAppointments;
    }

    public int getTotalAppointments() {
        return totalAppointments;
    }

    public void setTotalAppointments(int totalAppointments) {
        this.totalAppointments = totalAppointments;
    }
}
