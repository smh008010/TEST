package com.njxzc.model;

import java.io.Serializable;

/**
 * position
 * @author 
 */
public class Position implements Serializable {
    private Integer poid;

    private String poname;

    private Integer posalary;

    private Integer isDelete;

    private static final long serialVersionUID = 1L;

    public Integer getPoid() {
        return poid;
    }

    public void setPoid(Integer poid) {
        this.poid = poid;
    }

    public String getPoname() {
        return poname;
    }

    public void setPoname(String poname) {
        this.poname = poname;
    }

    public Integer getPosalary() {
        return posalary;
    }

    public void setPosalary(Integer posalary) {
        this.posalary = posalary;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
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
        Position other = (Position) that;
        return (this.getPoid() == null ? other.getPoid() == null : this.getPoid().equals(other.getPoid()))
            && (this.getPoname() == null ? other.getPoname() == null : this.getPoname().equals(other.getPoname()))
            && (this.getPosalary() == null ? other.getPosalary() == null : this.getPosalary().equals(other.getPosalary()))
            && (this.getIsDelete() == null ? other.getIsDelete() == null : this.getIsDelete().equals(other.getIsDelete()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getPoid() == null) ? 0 : getPoid().hashCode());
        result = prime * result + ((getPoname() == null) ? 0 : getPoname().hashCode());
        result = prime * result + ((getPosalary() == null) ? 0 : getPosalary().hashCode());
        result = prime * result + ((getIsDelete() == null) ? 0 : getIsDelete().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", poid=").append(poid);
        sb.append(", poname=").append(poname);
        sb.append(", posalary=").append(posalary);
        sb.append(", isDelete=").append(isDelete);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}