package com.njxzc.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * indrug
 * @author 
 */
public class Indrug implements Serializable {
    private Integer indrugid;

    private Integer drugid;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
    private Date date;

    private Integer innumber;

    private Integer state;

    private Drug drug;
    
    private static final long serialVersionUID = 1L;

    public Integer getIndrugid() {
        return indrugid;
    }

    public void setIndrugid(Integer indrugid) {
        this.indrugid = indrugid;
    }

    public Integer getDrugid() {
        return drugid;
    }

    public void setDrugid(Integer drugid) {
        this.drugid = drugid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getInnumber() {
        return innumber;
    }

    public void setInnumber(Integer innumber) {
        this.innumber = innumber;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
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
        Indrug other = (Indrug) that;
        return (this.getIndrugid() == null ? other.getIndrugid() == null : this.getIndrugid().equals(other.getIndrugid()))
            && (this.getDrugid() == null ? other.getDrugid() == null : this.getDrugid().equals(other.getDrugid()))
            && (this.getDate() == null ? other.getDate() == null : this.getDate().equals(other.getDate()))
            && (this.getInnumber() == null ? other.getInnumber() == null : this.getInnumber().equals(other.getInnumber()))
            && (this.getState() == null ? other.getState() == null : this.getState().equals(other.getState()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getIndrugid() == null) ? 0 : getIndrugid().hashCode());
        result = prime * result + ((getDrugid() == null) ? 0 : getDrugid().hashCode());
        result = prime * result + ((getDate() == null) ? 0 : getDate().hashCode());
        result = prime * result + ((getInnumber() == null) ? 0 : getInnumber().hashCode());
        result = prime * result + ((getState() == null) ? 0 : getState().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", indrugid=").append(indrugid);
        sb.append(", drugid=").append(drugid);
        sb.append(", date=").append(date);
        sb.append(", innumber=").append(innumber);
        sb.append(", state=").append(state);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

	public Drug getDrug() {
		return drug;
	}

	public void setDrug(Drug drug) {
		this.drug = drug;
	}
}