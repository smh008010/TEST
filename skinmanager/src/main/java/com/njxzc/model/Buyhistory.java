package com.njxzc.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * buyhistory
 * @author 
 */
public class Buyhistory implements Serializable {
    private Integer buyhisid;

    private Integer customerid;

    private Integer productid;

    private Integer remain;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
    private Date buydate;

    private Customer customer;
    
    private Product product;
    
    private static final long serialVersionUID = 1L;

    public Integer getBuyhisid() {
        return buyhisid;
    }

    public void setBuyhisid(Integer buyhisid) {
        this.buyhisid = buyhisid;
    }

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Integer getRemain() {
        return remain;
    }

    public void setRemain(Integer remain) {
        this.remain = remain;
    }

    public Date getBuydate() {
        return buydate;
    }

    public void setBuydate(Date buydate) {
        this.buydate = buydate;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Buyhistory other = (Buyhistory) that;
        return (this.getBuyhisid() == null ? other.getBuyhisid() == null : this.getBuyhisid().equals(other.getBuyhisid()))
            && (this.getCustomerid() == null ? other.getCustomerid() == null : this.getCustomerid().equals(other.getCustomerid()))
            && (this.getProductid() == null ? other.getProductid() == null : this.getProductid().equals(other.getProductid()))
            && (this.getRemain() == null ? other.getRemain() == null : this.getRemain().equals(other.getRemain()))
            && (this.getBuydate() == null ? other.getBuydate() == null : this.getBuydate().equals(other.getBuydate()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getBuyhisid() == null) ? 0 : getBuyhisid().hashCode());
        result = prime * result + ((getCustomerid() == null) ? 0 : getCustomerid().hashCode());
        result = prime * result + ((getProductid() == null) ? 0 : getProductid().hashCode());
        result = prime * result + ((getRemain() == null) ? 0 : getRemain().hashCode());
        result = prime * result + ((getBuydate() == null) ? 0 : getBuydate().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", buyhisid=").append(buyhisid);
        sb.append(", customerid=").append(customerid);
        sb.append(", productid=").append(productid);
        sb.append(", remain=").append(remain);
        sb.append(", buydate=").append(buydate);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}