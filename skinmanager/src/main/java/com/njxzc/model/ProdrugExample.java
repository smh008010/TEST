package com.njxzc.model;

import java.util.ArrayList;
import java.util.List;

public class ProdrugExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public ProdrugExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getOffset() {
        return offset;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andProdrugidIsNull() {
            addCriterion("prodrugid is null");
            return (Criteria) this;
        }

        public Criteria andProdrugidIsNotNull() {
            addCriterion("prodrugid is not null");
            return (Criteria) this;
        }

        public Criteria andProdrugidEqualTo(Integer value) {
            addCriterion("prodrugid =", value, "prodrugid");
            return (Criteria) this;
        }

        public Criteria andProdrugidNotEqualTo(Integer value) {
            addCriterion("prodrugid <>", value, "prodrugid");
            return (Criteria) this;
        }

        public Criteria andProdrugidGreaterThan(Integer value) {
            addCriterion("prodrugid >", value, "prodrugid");
            return (Criteria) this;
        }

        public Criteria andProdrugidGreaterThanOrEqualTo(Integer value) {
            addCriterion("prodrugid >=", value, "prodrugid");
            return (Criteria) this;
        }

        public Criteria andProdrugidLessThan(Integer value) {
            addCriterion("prodrugid <", value, "prodrugid");
            return (Criteria) this;
        }

        public Criteria andProdrugidLessThanOrEqualTo(Integer value) {
            addCriterion("prodrugid <=", value, "prodrugid");
            return (Criteria) this;
        }

        public Criteria andProdrugidIn(List<Integer> values) {
            addCriterion("prodrugid in", values, "prodrugid");
            return (Criteria) this;
        }

        public Criteria andProdrugidNotIn(List<Integer> values) {
            addCriterion("prodrugid not in", values, "prodrugid");
            return (Criteria) this;
        }

        public Criteria andProdrugidBetween(Integer value1, Integer value2) {
            addCriterion("prodrugid between", value1, value2, "prodrugid");
            return (Criteria) this;
        }

        public Criteria andProdrugidNotBetween(Integer value1, Integer value2) {
            addCriterion("prodrugid not between", value1, value2, "prodrugid");
            return (Criteria) this;
        }

        public Criteria andProidIsNull() {
            addCriterion("proid is null");
            return (Criteria) this;
        }

        public Criteria andProidIsNotNull() {
            addCriterion("proid is not null");
            return (Criteria) this;
        }

        public Criteria andProidEqualTo(Integer value) {
            addCriterion("proid =", value, "proid");
            return (Criteria) this;
        }

        public Criteria andProidNotEqualTo(Integer value) {
            addCriterion("proid <>", value, "proid");
            return (Criteria) this;
        }

        public Criteria andProidGreaterThan(Integer value) {
            addCriterion("proid >", value, "proid");
            return (Criteria) this;
        }

        public Criteria andProidGreaterThanOrEqualTo(Integer value) {
            addCriterion("proid >=", value, "proid");
            return (Criteria) this;
        }

        public Criteria andProidLessThan(Integer value) {
            addCriterion("proid <", value, "proid");
            return (Criteria) this;
        }

        public Criteria andProidLessThanOrEqualTo(Integer value) {
            addCriterion("proid <=", value, "proid");
            return (Criteria) this;
        }

        public Criteria andProidIn(List<Integer> values) {
            addCriterion("proid in", values, "proid");
            return (Criteria) this;
        }

        public Criteria andProidNotIn(List<Integer> values) {
            addCriterion("proid not in", values, "proid");
            return (Criteria) this;
        }

        public Criteria andProidBetween(Integer value1, Integer value2) {
            addCriterion("proid between", value1, value2, "proid");
            return (Criteria) this;
        }

        public Criteria andProidNotBetween(Integer value1, Integer value2) {
            addCriterion("proid not between", value1, value2, "proid");
            return (Criteria) this;
        }

        public Criteria andDrugidIsNull() {
            addCriterion("drugid is null");
            return (Criteria) this;
        }

        public Criteria andDrugidIsNotNull() {
            addCriterion("drugid is not null");
            return (Criteria) this;
        }

        public Criteria andDrugidEqualTo(Integer value) {
            addCriterion("drugid =", value, "drugid");
            return (Criteria) this;
        }

        public Criteria andDrugidNotEqualTo(Integer value) {
            addCriterion("drugid <>", value, "drugid");
            return (Criteria) this;
        }

        public Criteria andDrugidGreaterThan(Integer value) {
            addCriterion("drugid >", value, "drugid");
            return (Criteria) this;
        }

        public Criteria andDrugidGreaterThanOrEqualTo(Integer value) {
            addCriterion("drugid >=", value, "drugid");
            return (Criteria) this;
        }

        public Criteria andDrugidLessThan(Integer value) {
            addCriterion("drugid <", value, "drugid");
            return (Criteria) this;
        }

        public Criteria andDrugidLessThanOrEqualTo(Integer value) {
            addCriterion("drugid <=", value, "drugid");
            return (Criteria) this;
        }

        public Criteria andDrugidIn(List<Integer> values) {
            addCriterion("drugid in", values, "drugid");
            return (Criteria) this;
        }

        public Criteria andDrugidNotIn(List<Integer> values) {
            addCriterion("drugid not in", values, "drugid");
            return (Criteria) this;
        }

        public Criteria andDrugidBetween(Integer value1, Integer value2) {
            addCriterion("drugid between", value1, value2, "drugid");
            return (Criteria) this;
        }

        public Criteria andDrugidNotBetween(Integer value1, Integer value2) {
            addCriterion("drugid not between", value1, value2, "drugid");
            return (Criteria) this;
        }

        public Criteria andNumberIsNull() {
            addCriterion("number is null");
            return (Criteria) this;
        }

        public Criteria andNumberIsNotNull() {
            addCriterion("number is not null");
            return (Criteria) this;
        }

        public Criteria andNumberEqualTo(Integer value) {
            addCriterion("number =", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberNotEqualTo(Integer value) {
            addCriterion("number <>", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberGreaterThan(Integer value) {
            addCriterion("number >", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("number >=", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberLessThan(Integer value) {
            addCriterion("number <", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberLessThanOrEqualTo(Integer value) {
            addCriterion("number <=", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberIn(List<Integer> values) {
            addCriterion("number in", values, "number");
            return (Criteria) this;
        }

        public Criteria andNumberNotIn(List<Integer> values) {
            addCriterion("number not in", values, "number");
            return (Criteria) this;
        }

        public Criteria andNumberBetween(Integer value1, Integer value2) {
            addCriterion("number between", value1, value2, "number");
            return (Criteria) this;
        }

        public Criteria andNumberNotBetween(Integer value1, Integer value2) {
            addCriterion("number not between", value1, value2, "number");
            return (Criteria) this;
        }
    }

    /**
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}