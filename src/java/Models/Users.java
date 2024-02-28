package Models;


/**
 *
 * @author Tharindu Konesh
 */
public class Users {
    private int u_id;
    private String u_first_name;
    private String u_last_name;
    private String u_address;
    private String u_gender;
    private String u_email;
    private String u_phone;
    private String u_password;
    private String u_privileges;
    private String u_registered_date;
    private char is_deleted;

    public Users(String u_first_name, String u_last_name, String u_address, String u_gender, String u_email, String u_phone, String u_password, String u_privileges, String u_registered_date, char is_deleted) {
        this.u_first_name = u_first_name;
        this.u_last_name = u_last_name;
        this.u_address = u_address;
        this.u_gender = u_gender;
        this.u_email = u_email;
        this.u_phone = u_phone;
        this.u_password = u_password;
        this.u_privileges = u_privileges;
        this.u_registered_date = u_registered_date;
        this.is_deleted = is_deleted;
    }

    public Users(int u_id, String u_first_name, String u_last_name, String u_address, String u_gender, String u_email, String u_phone, String u_password, String u_privileges, String u_registered_date, char is_deleted) {
        this.u_id = u_id;
        this.u_first_name = u_first_name;
        this.u_last_name = u_last_name;
        this.u_address = u_address;
        this.u_gender = u_gender;
        this.u_email = u_email;
        this.u_phone = u_phone;
        this.u_password = u_password;
        this.u_privileges = u_privileges;
        this.u_registered_date = u_registered_date;
        this.is_deleted = is_deleted;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getU_first_name() {
        return u_first_name;
    }

    public void setU_first_name(String u_first_name) {
        this.u_first_name = u_first_name;
    }

    public String getU_last_name() {
        return u_last_name;
    }

    public void setU_last_name(String u_last_name) {
        this.u_last_name = u_last_name;
    }

    public String getU_address() {
        return u_address;
    }

    public void setU_address(String u_address) {
        this.u_address = u_address;
    }

    public String getU_gender() {
        return u_gender;
    }

    public void setU_gender(String u_gender) {
        this.u_gender = u_gender;
    }

    public String getU_email() {
        return u_email;
    }

    public void setU_email(String u_email) {
        this.u_email = u_email;
    }

    public String getU_phone() {
        return u_phone;
    }

    public void setU_phone(String u_phone) {
        this.u_phone = u_phone;
    }

    public String getU_password() {
        return u_password;
    }

    public void setU_password(String u_password) {
        this.u_password = u_password;
    }

    public String getU_privileges() {
        return u_privileges;
    }

    public void setU_privileges(String u_privileges) {
        this.u_privileges = u_privileges;
    }

    public String getU_registered_date() {
        return u_registered_date;
    }

    public void setU_registered_date(String u_registered_date) {
        this.u_registered_date = u_registered_date;
    }

    public char getIs_deleted() {
        return is_deleted;
    }

    public void setIs_deleted(char is_deleted) {
        this.is_deleted = is_deleted;
    }
}
