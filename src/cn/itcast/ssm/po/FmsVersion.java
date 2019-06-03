package cn.itcast.ssm.po;

import java.util.Date;

public class FmsVersion {
    private Double versionNumber;

    private Date versionDate;

    private String versionType;

    public Double getVersionNumber() {
        return versionNumber;
    }

    public void setVersionNumber(Double versionNumber) {
        this.versionNumber = versionNumber;
    }

    public Date getVersionDate() {
        return versionDate;
    }

    public void setVersionDate(Date versionDate) {
        this.versionDate = versionDate;
    }

    public String getVersionType() {
        return versionType;
    }

    public void setVersionType(String versionType) {
        this.versionType = versionType == null ? null : versionType.trim();
    }
}