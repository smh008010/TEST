package com.njxzc.model;

import java.io.Serializable;

/**
 * positionmenu
 * @author 
 */
public class Positionmenu implements Serializable {
    private Integer pmId;

    private Integer menuId;

    private Integer poid;

    private static final long serialVersionUID = 1L;

    public Integer getPmId() {
        return pmId;
    }

    public void setPmId(Integer pmId) {
        this.pmId = pmId;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public Integer getPoid() {
        return poid;
    }

    public void setPoid(Integer poid) {
        this.poid = poid;
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
        Positionmenu other = (Positionmenu) that;
        return (this.getPmId() == null ? other.getPmId() == null : this.getPmId().equals(other.getPmId()))
            && (this.getMenuId() == null ? other.getMenuId() == null : this.getMenuId().equals(other.getMenuId()))
            && (this.getPoid() == null ? other.getPoid() == null : this.getPoid().equals(other.getPoid()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getPmId() == null) ? 0 : getPmId().hashCode());
        result = prime * result + ((getMenuId() == null) ? 0 : getMenuId().hashCode());
        result = prime * result + ((getPoid() == null) ? 0 : getPoid().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", pmId=").append(pmId);
        sb.append(", menuId=").append(menuId);
        sb.append(", poid=").append(poid);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}