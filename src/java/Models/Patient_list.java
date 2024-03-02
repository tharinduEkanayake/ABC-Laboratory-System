
package Models;

/**
 *
 * @author Tharindu Konesh
 */
public class Patient_list {
    private int p_id;
    private String p_name;
    private String p_gender;
    private String p_address;
    private String p_birthday;
    private int p_age;
    private String p_email;
    private String p_phone;
    private String p_password;
    private String p_privileges;
    private String p_register_date;
    private String password_changed;

    public Patient_list(String p_name, String p_gender, String p_address, String p_birthday, int p_age, String p_email, String p_phone, String p_password, String p_privileges, String p_register_date, String password_changed) {
        this.p_name = p_name;
        this.p_gender = p_gender;
        this.p_address = p_address;
        this.p_birthday = p_birthday;
        this.p_age = p_age;
        this.p_email = p_email;
        this.p_phone = p_phone;
        this.p_password = p_password;
        this.p_privileges = p_privileges;
        this.p_register_date = p_register_date;
        this.password_changed = password_changed;
    }

    public Patient_list(int p_id, String p_name, String p_gender, String p_address, String p_birthday, int p_age, String p_email, String p_phone, String p_password, String p_privileges, String p_register_date, String password_changed) {
        this.p_id = p_id;
        this.p_name = p_name;
        this.p_gender = p_gender;
        this.p_address = p_address;
        this.p_birthday = p_birthday;
        this.p_age = p_age;
        this.p_email = p_email;
        this.p_phone = p_phone;
        this.p_password = p_password;
        this.p_privileges = p_privileges;
        this.p_register_date = p_register_date;
        this.password_changed = password_changed;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_gender() {
        return p_gender;
    }

    public void setP_gender(String p_gender) {
        this.p_gender = p_gender;
    }

    public String getP_address() {
        return p_address;
    }

    public void setP_address(String p_address) {
        this.p_address = p_address;
    }

    public String getP_birthday() {
        return p_birthday;
    }

    public void setP_birthday(String p_birthday) {
        this.p_birthday = p_birthday;
    }

    public int getP_age() {
        return p_age;
    }

    public void setP_age(int p_age) {
        this.p_age = p_age;
    }

    public String getP_email() {
        return p_email;
    }

    public void setP_email(String p_email) {
        this.p_email = p_email;
    }

    public String getP_phone() {
        return p_phone;
    }

    public void setP_phone(String p_phone) {
        this.p_phone = p_phone;
    }

    public String getP_password() {
        return p_password;
    }

    public void setP_password(String p_password) {
        this.p_password = p_password;
    }

    public String getP_privileges() {
        return p_privileges;
    }

    public void setP_privileges(String p_privileges) {
        this.p_privileges = p_privileges;
    }

    public String getP_register_date() {
        return p_register_date;
    }

    public void setP_register_date(String p_register_date) {
        this.p_register_date = p_register_date;
    }

    public String getPassword_changed() {
        return password_changed;
    }

    public void setPassword_changed(String password_changed) {
        this.password_changed = password_changed;
    }
}
