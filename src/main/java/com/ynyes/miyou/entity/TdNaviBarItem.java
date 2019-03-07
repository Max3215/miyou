package com.ynyes.miyou.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 * 导航栏
 * 
 * @author Max
 *
 */

@Entity
public class TdNaviBarItem {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
	
    // 名称
    @Column
    private String title;
    
    // 别名
    @Column
    private String engTitle;
    
    // 图片地址
    @Column
    private String iconUri;
    
    // 排序号
    @Column
    private Long sortId;

    // 是否使能
    @Column
    private Boolean isEnable;
    
    // 是否是触屏版显示
    @Column
    private Boolean isTouchShow;
    
    // 链接地址
    @Column
    private String linkUri;
    
    // 父ID
    @Column
    private Long parentId;
    
    // 层级
    @Column
    private Long layerCount;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getEngTitle() {
		return engTitle;
	}

	public void setEngTitle(String engTitle) {
		this.engTitle = engTitle;
	}

	public String getIconUri() {
        return iconUri;
    }

    public void setIconUri(String iconUri) {
        this.iconUri = iconUri;
    }

    public Long getSortId() {
        return sortId;
    }

    public void setSortId(Long sortId) {
        this.sortId = sortId;
    }

    public Boolean getIsEnable() {
        return isEnable;
    }

    public void setIsEnable(Boolean isEnable) {
        this.isEnable = isEnable;
    }

    public String getLinkUri() {
        return linkUri;
    }

    public void setLinkUri(String linkUri) {
        this.linkUri = linkUri;
    }

    public Boolean getIsTouchShow() {
        return isTouchShow;
    }

    public void setIsTouchShow(Boolean isTouchShow) {
        this.isTouchShow = isTouchShow;
    }

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Long getLayerCount() {
		return layerCount;
	}

	public void setLayerCount(Long layerCount) {
		this.layerCount = layerCount;
	}
    
    
}
