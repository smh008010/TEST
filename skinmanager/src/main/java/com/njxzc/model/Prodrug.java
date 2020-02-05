package com.njxzc.model;

import java.io.Serializable;

/**
 * prodrug
 * @author 
 */
public class Prodrug implements Serializable {
    private Integer prodrugid;

    private Integer proid;

    private Integer drugid;

    private Integer number;

    private Product product; 
    
    private static final long serialVersionUID = 1L;

    public Integer getProdrugid() {
        return prodrugid;
    }

    public void setProdrugid(Integer prodrugid) {
        this.prodrugid = prodrugid;
    }

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public Integer getDrugid() {
        return drugid;
    }

    public void setDrugid(Integer drugid) {
        this.drugid = drugid;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
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
        Prodrug other = (Prodrug) that;
        return (this.getProdrugid() == null ? other.getProdrugid() == null : this.getProdrugid().equals(other.getProdrugid()))
            && (this.getProid() == null ? other.getProid() == null : this.getProid().equals(other.getProid()))
            && (this.getDrugid() == null ? other.getDrugid() == null : this.getDrugid().equals(other.getDrugid()))
            && (this.getNumber() == null ? other.getNumber() == null : this.getNumber().equals(other.getNumber()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getProdrugid() == null) ? 0 : getProdrugid().hashCode());
        result = prime * result + ((getProid() == null) ? 0 : getProid().hashCode());
        result = prime * result + ((getDrugid() == null) ? 0 : getDrugid().hashCode());
        result = prime * result + ((getNumber() == null) ? 0 : getNumber().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", prodrugid=").append(prodrugid);
        sb.append(", proid=").append(proid);
        sb.append(", drugid=").append(drugid);
        sb.append(", number=").append(number);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}