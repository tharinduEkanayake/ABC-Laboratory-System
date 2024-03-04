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
    
    public static Users getOneUser(int u_id){
        Users users_list = null;
        
        var connection = getConnection();
        try{
            
            var callableStatement = connection.prepareCall("{CALL get_one_user(?)}");

            callableStatement.setInt(1, u_id);

            var resultSet = callableStatement.executeQuery();
                        
            
            if (resultSet.next()) {
                
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
                            
                
                var user = new Users( u_id,  u_first_name,  u_last_name,  u_address,  u_gender,  u_email,  u_phone, u_password,  u_privileges,  u_registered_date,  is_deleted);
                return user;
            }
            
        }catch(Exception e){
            System.out.println("one User error : " + e);
        }
        
        return users_list;
    }
    
    
    public static Test getOneTest(int t_id){
        Test testList = null;
        
        var connection = getConnection();
        try{
            var callableStatement = connection.prepareCall("{CALL get_one_test(?)}");

            callableStatement.setInt(1, t_id);

            var resultSet = callableStatement.executeQuery();
                        
            
            if (resultSet.next()) {
                
                String t_name = resultSet.getString("t_name");
                double charges = resultSet.getDouble("charges");
                String references_level = resultSet.getString("references_level");
                String is_deleted = resultSet.getString("is_deleted");
                
                
                var test = new Test( t_id,  t_name,  charges,  references_level,  is_deleted);
                return test;
            }
            
        }catch(Exception e){
            System.out.println("one test error : " + e);
        }
        
        return testList;
    }
    
    public static Patient_list getOneCustomer(int p_id){
        Patient_list patientList = null;
        
        var connection = getConnection();
        try{
            
            var callableStatement = connection.prepareCall("{CALL get_one_patient(?)}");

            callableStatement.setInt(1, p_id);

            var resultSet = callableStatement.executeQuery();
                        
            
            if (resultSet.next()) {
                
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
                
                
                var patient = new Patient_list( p_id,  p_name,  p_gender,  p_address,  p_birthday,  p_age, p_email,  p_phone,  p_password,  p_privileges,  p_register_date, password_changed);
                return patient;
            }
            
        }catch(Exception e){
            System.out.println("One Patient Error : " + e);
        }
        
        return patientList;
    }
    
    public static void inserTestDetails(int t_id,String t_name,double charges,String references_level){
        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL insert_test(?,?,?,?)}");
            
            callableStatement.setInt(1, t_id);
            callableStatement.setString(2, t_name);
            callableStatement.setDouble(3, charges);
            callableStatement.setString(4, references_level);


            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("Insert User Error : " + e);
        }
    }

    public static void insertUserDetails(int u_id,String u_first_name,String u_last_name,String u_address,String u_gender,String u_email,String u_phone,String u_password,String u_privileges,String u_registered_date) {
        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL insert_user(?,?,?,?,?,?,?,?,?,?)}");

            callableStatement.setInt(1, u_id);
            callableStatement.setString(2, u_first_name);
            callableStatement.setString(3, u_last_name);
            callableStatement.setString(4, u_address);
            callableStatement.setString(5, u_gender);
            callableStatement.setString(6, u_email);
            callableStatement.setString(7, u_phone);
            callableStatement.setString(8, u_password);
            callableStatement.setString(9, u_privileges);
            callableStatement.setString(10, u_registered_date);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("Insert User Error : " + e);
        }
    }

    public static void insertCustomerDetails(int maxId, String p_name, String p_gender, String p_address, String p_birthday, String p_email, String p_phone, String p_password, String p_privileges, String p_register_date) {

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL insert_patient(?,?,?,?,?,?,?,?,?,?)}");

            callableStatement.setInt(1, maxId);
            callableStatement.setString(2, p_name);
            callableStatement.setString(3, p_gender);
            callableStatement.setString(4, p_address);
            callableStatement.setString(5, p_birthday);
            callableStatement.setString(6, p_email);
            callableStatement.setString(7, p_phone);
            callableStatement.setString(8, p_password);
            callableStatement.setString(9, p_privileges);
            callableStatement.setString(10, p_register_date);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("Insert Customer Error : " + e);
        }
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

                var appoint = new Appointment_list(a_id, a_date, register_date, is_cencelled, a_status, patient_id);
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

//  getMax id methods
    public static int getCustomerMax() {
        int max = 0;
        try (var connection = getConnection()) {

            var callableStatement = connection.prepareCall("{CALL max_patient_list()}");
            var resultSet = callableStatement.executeQuery();

            if (resultSet.next()) {
                max = resultSet.getInt("max_id");
            }

        } catch (Exception e) {
            System.out.println("Cus Max Error " + e);
        }

        return max;

    }

    public static int getUserMax() {
        int max = 0;
        try (var connection = getConnection()) {

            var callableStatement = connection.prepareCall("{CALL max_users()}");
            var resultSet = callableStatement.executeQuery();

            if (resultSet.next()) {
                max = resultSet.getInt("max_id");
            }

        } catch (Exception e) {
            System.out.println("User Max Error " + e);
        }

        return max;

    }
    
    public static int getTestMax() {
        int max = 0;
        try (var connection = getConnection()) {

            var callableStatement = connection.prepareCall("{CALL max_test()}");
            var resultSet = callableStatement.executeQuery();

            if (resultSet.next()) {
                max = resultSet.getInt("max_id");
            }

        } catch (Exception e) {
            System.out.println("User Max Error " + e);
        }

        return max;

    }

}
