
package dto;

/**
 *
 * @author nikhil
 */
public class BookOrderDTO 
{
        private int id ;
        private String orderId;
        private String userName ;
        private String email ;
        private String phone ;
        private String fullAddress ;
        private String paymentType ;
        private String bookName;
        private String author;
        private String price;

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
        
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
        
    public BookOrderDTO()
    {
        super();
    }
        
        
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    @Override
    public String toString() {
        return "BookOrderDTO{" + "id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email + ", phone=" + phone + ", fullAddress=" + fullAddress + ", paymentType=" + paymentType + ", bookName=" + bookName + ", author=" + author + ", price=" + price + '}';
    }

    
}
