package Mybeans;

public class UserStudent {

    private String Sno;
    private String password;

    @Override
    public String toString() {
        return "UserStudent{" +
                "Sno='" + Sno + '\'' +
                ", password='" + password + '\'';
    }

    public String getSno() {
        return Sno;
    }

    public void setSno(String Sno) {
        this.Sno = Sno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
