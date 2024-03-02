package Controllers;

import Models.Appointment_list;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Models.LoginModel;
import Models.PatientTesteReportModel;
import Models.Patient_list;
import Models.Test;
import Models.Users;

/**
 *
 * @author Tharindu Konesh
 */
public class DBUtil {

    private static final String dbUrl = "jdbc:mysql://localhost:3306/abc_laboratory_db?autoReconnect=true&useSSL=false";
    private static final String dbUsername = "root";
    private static final String dbPassword = "";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex);
        }
        return connection;
    }

    public static List<Appointment_list> getAppointmentDetails() {
        ArrayList<Appointment_list> appintments = new ArrayList<>();

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL get_appointment_list()}");

            var resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {

                int a_id = resultSet.getInt("a_id");
                String a_date = resultSet.getString("a_date");
                String register_date = resultSet.getString("register_date");
                String is_cencelled = resultSet.getString("is_cencelled");
                String a_status = resultSet.getString("a_status");
                int patient_id = resultSet.getInt("patient_id");

                var appoint = new Appointment_list(a_id,a_date,register_date,is_cencelled,a_status,patient_id);
                appintments.add(appoint);
            }
        } catch (Exception e) {
            System.out.println("getAppointments Error : " + e);
        }

        return appintments;
    }

    public static List<Test> getTestPackages() {
        ArrayList<Test> tests = new ArrayList<>();

        var connection = getConnection();

        try {
            var callableStatement = connection.prepareCall("{CALL get_test_list()}");

            var resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {

                int t_id = resultSet.getInt("t_id");
                String t_name = resultSet.getString("t_name");
                double charges = resultSet.getDouble("charges");
                String references_level = resultSet.getString("references_level");
                String is_deleted = resultSet.getString("is_deleted");

                var test = new Test(t_id, t_name, charges, references_level, is_deleted);
                tests.add(test);
            }
        } catch (Exception e) {
            System.out.println("getTestsList Error : " + e);
        }

        return tests;
    }

    public static List<Users> getUsersList() {
        ArrayList<Users> usersList = new ArrayList<>();

        var connection = getConnection();

        try {
            var callableStatement = connection.prepareCall("{CALL ger_users_list()}");

            var resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {

                int u_id = resultSet.getInt("u_id");
                String u_first_name = resultSet.getString("u_first_name");
                String u_last_name = resultSet.getString("u_last_name");
                String u_address = resultSet.getString("u_address");
                String u_gender = resultSet.getString("u_gender");
                String u_email = resultSet.getString("u_email");
                String u_phone = resultSet.getString("u_phone");
                String u_password = resultSet.getString("u_password");
                String u_privileges = resultSet.getString("u_privileges");
                String u_registered_date = resultSet.getString("u_registered_date");
                String is_deleted = resultSet.getString("is_deleted");

                var user = new Users(u_id, u_first_name, u_last_name, u_address, u_gender, u_email, u_phone, u_password, u_privileges, u_registered_date, is_deleted);

                usersList.add(user);

            }
        } catch (Exception e) {
            System.out.println("getUsersList Error : " + e);
        }

        return usersList;
    }

    public static List<Patient_list> getPatientDetails() {
        ArrayList<Patient_list> patientList = new ArrayList<>();

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL get_patient_list()}");

            var resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                int p_id = resultSet.getInt("p_id");
                String p_name = resultSet.getString("p_name");
                String p_gender = resultSet.getString("p_gender");
                String p_address = resultSet.getString("p_address");
                String p_birthday = resultSet.getString("p_birthday");
                int p_age = resultSet.getInt("p_age");
                String p_email = resultSet.getString("p_email");
                String p_phone = resultSet.getString("p_phone");
                String p_password = resultSet.getString("p_password");
                String p_privileges = resultSet.getString("p_privileges");
                String p_register_date = resultSet.getString("p_register_date");
                String password_changed = resultSet.getString("password_changed");

                var test_reports = new Patient_list(p_id, p_name, p_gender, p_address, p_birthday, p_age, p_email, p_phone, p_password, p_privileges, p_register_date, password_changed);

                patientList.add(test_reports);

            }
        } catch (Exception e) {
            System.out.println("getPatientDetails Error : " + e);
        }

        return patientList;
    }

    public static LoginModel getLoginDetails(String lusername, String lpassword) {
        LoginModel user = null;

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL getLoginDetails(?,?)}");

            callableStatement.setString(1, lusername);
            callableStatement.setString(2, lpassword);

            var resultSet = callableStatement.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String username = resultSet.getString("email");
                String password = resultSet.getString("password");
                String privilage = resultSet.getString("privileges");

                var userdata = new LoginModel(id, username, password, privilage);
                return userdata;
            }

        } catch (Exception e) {
            System.out.println("Connection Error!" + e);
        }

        return user;

    }

    public static List<PatientTesteReportModel> getTestReportList(int pid) {

        ArrayList<PatientTesteReportModel> reportList = new ArrayList<>();

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL getPatientReportData(?)}");

            callableStatement.setInt(1, pid);

            var resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {

                int report_id = resultSet.getInt("report_id");
                String test_time = resultSet.getString("test_time");
                String report_data = resultSet.getString("report_data");
                String report_status = resultSet.getString("report_status");
                String t_isCancelled = resultSet.getString("t_isCancelled");
                int a_id = resultSet.getInt("a_id");
                String a_date = resultSet.getString("a_date");
                String test_name = resultSet.getString("test_name");
                double charges = resultSet.getDouble("charges");
                String ref_level = resultSet.getString("ref_level");

                var test_reports = new PatientTesteReportModel(report_id, test_time, report_data, report_status, t_isCancelled, a_id, a_date, test_name, charges, ref_level);

                reportList.add(test_reports);

            }

        } catch (Exception e) {
            System.out.println("Connection Error!");
        }

        return reportList;
    }

}