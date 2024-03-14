
package Models;

/**
 *
 * @author Tharindu Konesh
 */
public class TodayCompleteTests {
    private int noOfTests;
    private String testname;

    public TodayCompleteTests(int noOfTests, String testname) {
        this.noOfTests = noOfTests;
        this.testname = testname;
    }

    public int getNoOfTests() {
        return noOfTests;
    }

    public void setNoOfTests(int noOfTests) {
        this.noOfTests = noOfTests;
    }

    public String getTestname() {
        return testname;
    }

    public void setTestname(String testname) {
        this.testname = testname;
    }
    
    
    
}
