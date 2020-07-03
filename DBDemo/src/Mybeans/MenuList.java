package Mybeans;

public class MenuList {
    private int Mno;
    private String Mname;
    private int Window;
    private int amount;
    private int price;

    public int getMno() {
        return Mno;
    }

    public void setMno(int mno) {
        Mno = mno;
    }

    public String getMname() {
        return Mname;
    }

    public void setMname(String mname) {
        Mname = mname;
    }

    public int getWindow() {
        return Window;
    }

    public void setWindow(int window) {
        Window = window;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "MenuList{" +
                "Mno=" + Mno +
                ", Mname='" + Mname + '\'' +
                ", Window=" + Window +
                ", amount=" + amount +
                ", price=" + price +
                '}';
    }
}
