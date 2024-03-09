package Controllers;

import Models.AppointmentSelectedTest;
import Models.Appointment_list;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Models.LoginModel;
import Models.PatientTesteReportModel;
import Models.Patient_list;
import Models.Payment;
import Models.PendingAppointment;
import Models.PendingPayment;
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
    
    public static void updateAppointmentStatus(int a_id) {

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL updateAppointmentStatus(?)}");

            callableStatement.setInt(1, a_id);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("update User error : " + e);
        }

    }
    
    public static void insertPayment(int p_id,double amount,String p_method,String p_date,int a_id) {

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL insert_payment(?,?,?,?,?,?)}");

            callableStatement.setInt(1, p_id);
            callableStatement.setDouble(2, amount);
            callableStatement.setString(3, p_method);
            callableStatement.setString(4, p_date);
            callableStatement.setString(5, "T");
            callableStatement.setInt(6, a_id);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("update User error : " + e);
        }

    }    
    
    public static PendingPayment getOneTestReport(int tr_id){
        PendingPayment paymentList = null ;
        
        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL getOneTestReport(?)}");

            callableStatement.setInt(1, tr_id);
            
            var resultSet = callableStatement.executeQuery();

            if (resultSet.next()) {

                int test_report_id = resultSet.getInt("test_repo_id");
                int a_id = resultSet.getInt("appointment_id");
                String t_name = resultSet.getString("t_name");
                double charges = resultSet.getDouble("charges");

                var payment = new PendingPayment(test_report_id,  a_id,  t_name,  charges);
                return payment;
            }

        } catch (Exception e) {
            System.out.println("get one payment error : " + e);
        }
                
        return paymentList;
    }
    
//    public static Payment getOnePayment(int p_id){
//        Payment paymentList = null ;
//        
//        var connection = getConnection();
//        try {
//            var callableStatement = connection.prepareCall("{CALL getOnePayment(?)}");
//
//            callableStatement.setInt(1, p_id);
//            
//            var resultSet = callableStatement.executeQuery();
//
//            if (resultSet.next()) {
//
//                int pay_id = resultSet.getInt("pay_id");
//                double total_value = resultSet.getDouble("total_value");
//                String pay_method = resultSet.getString("pay_method");
//                String pay_date = resultSet.getString("pay_date");
//                String pay_status = resultSet.getString("pay_status");
//                int appointment_id = resultSet.getInt("appointment_id");
//
//                var payment = new Payment(pay_id,  total_value,  pay_method,  pay_date,  pay_status,  appointment_id);
//                return payment;
//            }
//
//        } catch (Exception e) {
//            System.out.println("get one payment error : " + e);
//        }
//                
//        return paymentList;
//    }
    
    
    
    
    
    
    
    
    
    public static List<PendingPayment> getPendingPaymentList(){
        ArrayList<PendingPayment> paymentList = new ArrayList<>();
        
        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL getPendingPayment()}");

            var resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {

//                , int , String , double 
//                        

                int test_report_id = resultSet.getInt("test_repo_id");
                int a_id = resultSet.getInt("appointment_id");
                String t_name = resultSet.getString("t_name");
                double charges = resultSet.getDouble("charges");
                

                var payment = new PendingPayment(test_report_id,  a_id,  t_name,  charges);
                paymentList.add(payment);
            }

        } catch (Exception e) {
            System.out.println("update User error : " + e);
        }
                
        return paymentList;
    }
    
    public static void updateTestReportDetails(int tr_id,String t_time,String r_data,int t_id) {
        
        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL updateTestReportDetails(?,?,?,?)}");

            callableStatement.setInt(1, tr_id);
            callableStatement.setString(2,t_time);
            callableStatement.setString(3,r_data);
            callableStatement.setInt(4,t_id);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("update User error : " + e);
        }

    }
    
    public static List<PendingAppointment> getPendingAppointment() {
        ArrayList<PendingAppointment> appointmentList = new ArrayList<>();

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL getpPendingAppointmentList()}");

            var resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {

//                test_repo_id, int appointment, int patient_id, String p_name, String t_name
                int test_repo_id = resultSet.getInt("test_repo_id");
                int appointment_id = resultSet.getInt("appointment_id");
                int patient_id = resultSet.getInt("patient_id");
                String p_name = resultSet.getString("p_name");
                String t_name = resultSet.getString("t_name");

                var appointment = new PendingAppointment(test_repo_id,appointment_id,patient_id,p_name,t_name);
                appointmentList.add(appointment);
            }

        } catch (Exception e) {
            System.out.println("update User error : " + e);
        }

        return appointmentList;
    }

    public static void deleteAppointment(int a_id) {

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL delete_appointment(?)}");

            callableStatement.setInt(1, a_id);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("update User error : " + e);
        }

    }

    public static List<AppointmentSelectedTest> getAppointmentSelectedTestDetails(int a_id) {
        ArrayList<AppointmentSelectedTest> testList = new ArrayList<>();

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL getSelectedAppointmentTestList(?)}");

            callableStatement.setInt(1, a_id);

            var resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {

                int test_repo_id = resultSet.getInt("test_repo_id");
                String t_name = resultSet.getString("t_name");
                String tr_time = resultSet.getString("tr_time");
                String t_report_data = resultSet.getString("t_report_data");
                int technician_id = resultSet.getInt("technician_id");

                var test = new AppointmentSelectedTest(test_repo_id, t_name, tr_time, t_report_data, technician_id);
                testList.add(test);
            }
        } catch (Exception e) {
            System.out.println("getAppointmentsTestList Error : " + e);
        }

        return testList;
    }

    public static void insertTestReportByFrontdesk(int aID, int tID) {
        int testreportid = getTestReportMax();
        testreportid += 1;

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL insert_report_data_by_frontdesk(?,?,?)}");

            callableStatement.setInt(1, testreportid);
            callableStatement.setInt(2, aID);
            callableStatement.setInt(3, tID);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("update User error : " + e);
        }

    }

    public static void insertAppointments(int a_id, String a_date, String a_time, String register_date, String a_status, int patient_id) {

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL insert_appointment(?,?,?,?,?,?)}");

            callableStatement.setInt(1, a_id);
            callableStatement.setString(2, a_date);
            callableStatement.setString(3, a_time);
            callableStatement.setString(4, register_date);
            callableStatement.setString(5, a_status);
            callableStatement.setInt(6, patient_id);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("update User error : " + e);
        }

    }

    public static void deleteTets(int t_id) {

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL delete_test(?)}");

            callableStatement.setInt(1, t_id);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("delete test error : " + e);
        }

    }

    public static void deleteUser(int u_id) {

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL delete_user(?)}");

            callableStatement.setInt(1, u_id);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("delete user error : " + e);
        }

    }

//    public static void deleteCustomer(int p_id){
//        
//        var connection = getConnection();
//        try{
//            var callableStatement = connection.prepareCall("{CALL (?,?)}");
//
//            callableStatement.setInt(1, p_id);
//            callableStatement.setDouble(2, 'F');
//        
//            callableStatement.executeQuery();
//            
//        }catch(Exception e){
//            System.out.println("update Test error : " + e);
//        }
//        
//    }
    public static void updateTestDetails(int t_id, double charges, String references_level) {

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL update_test_details(?,?,?)}");

            callableStatement.setInt(1, t_id);
            callableStatement.setDouble(2, charges);
            callableStatement.setString(3, references_level);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("update Test error : " + e);
        }

    }

    public static void insertUserDetails(int u_id, String u_first_name, String u_last_name, String u_address, String u_phone) {

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL update_user_details(?,?,?,?,?)}");

            callableStatement.setInt(1, u_id);
            callableStatement.setString(2, u_first_name);
            callableStatement.setString(3, u_last_name);
            callableStatement.setString(4, u_address);
            callableStatement.setString(5, u_phone);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("update User error : " + e);
        }

    }

    public static void updateCustomer(int p_id, String p_name, String p_address, String p_phone) {
        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL update_customere_details(?,?,?,?)}");

            callableStatement.setInt(1, p_id);
            callableStatement.setString(2, p_name);
            callableStatement.setString(3, p_address);
            callableStatement.setString(4, p_phone);

            callableStatement.executeQuery();

        } catch (Exception e) {
            System.out.println("update customer error : " + e);
        }
    }

    public static Users getOneUser(int u_id) {
        Users users_list = null;

        var connection = getConnection();
        try {

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

                var user = new Users(u_id, u_first_name, u_last_name, u_address, u_gender, u_email, u_phone, u_password, u_privileges, u_registered_date, is_deleted);
                return user;
            }

        } catch (Exception e) {
            System.out.println("one User error : " + e);
        }

        return users_list;
    }

    public static Test getOneTest(int t_id) {
        Test testList = null;

        var connection = getConnection();
        try {
            var callableStatement = connection.prepareCall("{CALL get_one_test(?)}");

            callableStatement.setInt(1, t_id);

            var resultSet = callableStatement.executeQuery();

            if (resultSet.next()) {

                String t_name = resultSet.getString("t_name");
                double charges = resultSet.getDouble("charges");
                String references_level = resultSet.getString("references_level");
                String is_deleted = resultSet.getString("is_deleted");

                var test = new Test(t_id, t_name, charges, references_level, is_deleted);
                return test;
            }

        } catch (Exception e) {
            System.out.println("one test error : " + e);
        }

        return testList;
    }

    public static Patient_list getOneCustomer(int p_id) {
        Patient_list patientList = null;

        var connection = getConnection();
        try {

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

                var patient = new Patient_list(p_id, p_name, p_gender, p_address, p_birthday, p_age, p_email, p_phone, p_password, p_privileges, p_register_date, password_changed);
                return patient;
            }

        } catch (Exception e) {
            System.out.println("One Patient Error : " + e);
        }

        return patientList;
    }

    public static void inserTestDetails(int t_id, String t_name, double charges, String references_level) {
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

    public static void insertUserDetails(int u_id, String u_first_name, String u_last_name, String u_address, String u_gender, String u_email, String u_phone, String u_password, String u_privileges, String u_registered_date) {
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

    public static int getAppointmentMax() {
        int max = 0;
        try (var connection = getConnection()) {

            var callableStatement = connection.prepareCall("{CALL max_appointment_list()}");
            var resultSet = callableStatement.executeQuery();

            if (resultSet.next()) {
                max = resultSet.getInt("max_id");
            }

        } catch (Exception e) {
            System.out.println("User Max Error " + e);
        }

        return max;
    }

    public static int getTestReportMax() {
        int max = 0;
        try (var connection = getConnection()) {

            var callableStatement = connection.prepareCall("{CALL max_test_report()}");
            var resultSet = callableStatement.executeQuery();

            if (resultSet.next()) {
                max = resultSet.getInt("max_id");
            }

        } catch (Exception e) {
            System.out.println("User Max Error " + e);
        }

        return max;
    }
    
    public static int getPaymentMax() {
        int max = 0;
        try (var connection = getConnection()) {

            var callableStatement = connection.prepareCall("{CALL max_payment()}");
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
