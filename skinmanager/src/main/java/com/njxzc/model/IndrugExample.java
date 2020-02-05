package com.njxzc.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class IndrugExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public IndrugExample() {
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

        public Criteria andIndrugidIsNull() {
            addCriterion("indrugid is null");
            return (Criteria) this;
        }

        public Criteria andIndrugidIsNotNull() {
            addCriterion("indrugid is not null");
            return (Criteria) this;
        }

        public Criteria andIndrugidEqualTo(Integer value) {
            addCriterion("indrugid =", value, "indrugid");
            return (Criteria) this;
        }

        public Criteria andIndrugidNotEqualTo(Integer value) {
            addCriterion("indrugid <>", value, "indrugid");
            return (Criteria) this;
        }

        public Criteria andIndrugidGreaterThan(Integer value) {
            addCriterion("indrugid >", value, "indrugid");
            return (Criteria) this;
        }

        public Criteria andIndrugidGreaterThanOrEqualTo(Integer value) {
            addCriterion("indrugid >=", value, "indrugid");
            return (Criteria) this;
        }

        public Criteria andIndrugidLessThan(Integer value) {
            addCriterion("indrugid <", value, "indrugid");
            return (Criteria) this;
        }

        public Criteria andIndrugidLessThanOrEqualTo(Integer value) {
            addCriterion("indrugid <=", value, "indrugid");
            return (Criteria) this;
        }

        public Criteria andIndrugidIn(List<Integer> values) {
            addCriterion("indrugid in", values, "indrugid");
            return (Criteria) this;
        }

        public Criteria andIndrugidNotIn(List<Integer> values) {
            addCriterion("indrugid not in", values, "indrugid");
            return (Criteria) this;
        }

        public Criteria andIndrugidBetween(Integer value1, Integer value2) {
            addCriterion("indrugid between", value1, value2, "indrugid");
            return (Criteria) this;
        }

        public Criteria andIndrugidNotBetween(Integer value1, Integer value2) {
            addCriterion("indrugid not between", value1, value2, "indrugid");
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

        public Criteria andDateIsNull() {
            addCriterion("date is null");
            return (Criteria) this;
        }

        public Criteria andDateIsNotNull() {
            addCriterion("date is not null");
            return (Criteria) this;
        }

        public Criteria andDateEqualTo(Date value) {
            addCriterion("date =", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotEqualTo(Date value) {
            addCriterion("date <>", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThan(Date value) {
            addCriterion("date >", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThanOrEqualTo(Date value) {
            addCriterion("date >=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThan(Date value) {
            addCriterion("date <", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThanOrEqualTo(Date value) {
            addCriterion("date <=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateIn(List<Date> values) {
            addCriterion("date in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotIn(List<Date> values) {
            addCriterion("date not in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateBetween(Date value1, Date value2) {
            addCriterion("date between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotBetween(Date value1, Date value2) {
            addCriterion("date not between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andInnumberIsNull() {
            addCriterion("innumber is null");
            return (Criteria) this;
        }

        public Criteria andInnumberIsNotNull() {
            addCriterion("innumber is not null");
            return (Criteria) this;
        }

        public Criteria andInnumberEqualTo(Integer value) {
            addCriterion("innumber =", value, "innumber");
            return (Criteria) this;
        }

        public Criteria andInnumberNotEqualTo(Integer value) {
            addCriterion("innumber <>", value, "innumber");
            return (Criteria) this;
        }

        public Criteria andInnumberGreaterThan(Integer value) {
            addCriterion("innumber >", value, "innumber");
            return (Criteria) this;
        }

        public Criteria andInnumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("innumber >=", value, "innumber");
            return (Criteria) this;
        }

        public Criteria andInnumberLessThan(Integer value) {
            addCriterion("innumber <", value, "innumber");
            return (Criteria) this;
        }

        public Criteria andInnumberLessThanOrEqualTo(Integer value) {
            addCriterion("innumber <=", value, "innumber");
            return (Criteria) this;
        }

        public Criteria andInnumberIn(List<Integer> values) {
            addCriterion("innumber in", values, "innumber");
            return (Criteria) this;
        }

        public Criteria andInnumberNotIn(List<Integer> values) {
            addCriterion("innumber not in", values, "innumber");
            return (Criteria) this;
        }

        public Criteria andInnumberBetween(Integer value1, Integer value2) {
            addCriterion("innumber between", value1, value2, "innumber");
            return (Criteria) this;
        }

        public Criteria andInnumberNotBetween(Integer value1, Integer value2) {
            addCriterion("innumber not between", value1, value2, "innumber");
            return (Criteria) this;
        }

        public Criteria andStateIsNull() {
            addCriterion("state is null");
            return (Criteria) this;
        }

        public Criteria andStateIsNotNull() {
            addCriterion("state is not null");
            return (Criteria) this;
        }

        public Criteria andStateEqualTo(Integer value) {
            addCriterion("state =", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotEqualTo(Integer value) {
            addCriterion("state <>", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThan(Integer value) {
            addCriterion("state >", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThanOrEqualTo(Integer value) {
            addCriterion("state >=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThan(Integer value) {
            addCriterion("state <", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThanOrEqualTo(Integer value) {
            addCriterion("state <=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateIn(List<Integer> values) {
            addCriterion("state in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotIn(List<Integer> values) {
            addCriterion("state not in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateBetween(Integer value1, Integer value2) {
            addCriterion("state between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotBetween(Integer value1, Integer value2) {
            addCriterion("state not between", value1, value2, "state");
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