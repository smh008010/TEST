package com.njxzc.model;

import java.util.ArrayList;
import java.util.List;

public class PositionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public PositionExample() {
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

        public Criteria andPoidIsNull() {
            addCriterion("poid is null");
            return (Criteria) this;
        }

        public Criteria andPoidIsNotNull() {
            addCriterion("poid is not null");
            return (Criteria) this;
        }

        public Criteria andPoidEqualTo(Integer value) {
            addCriterion("poid =", value, "poid");
            return (Criteria) this;
        }

        public Criteria andPoidNotEqualTo(Integer value) {
            addCriterion("poid <>", value, "poid");
            return (Criteria) this;
        }

        public Criteria andPoidGreaterThan(Integer value) {
            addCriterion("poid >", value, "poid");
            return (Criteria) this;
        }

        public Criteria andPoidGreaterThanOrEqualTo(Integer value) {
            addCriterion("poid >=", value, "poid");
            return (Criteria) this;
        }

        public Criteria andPoidLessThan(Integer value) {
            addCriterion("poid <", value, "poid");
            return (Criteria) this;
        }

        public Criteria andPoidLessThanOrEqualTo(Integer value) {
            addCriterion("poid <=", value, "poid");
            return (Criteria) this;
        }

        public Criteria andPoidIn(List<Integer> values) {
            addCriterion("poid in", values, "poid");
            return (Criteria) this;
        }

        public Criteria andPoidNotIn(List<Integer> values) {
            addCriterion("poid not in", values, "poid");
            return (Criteria) this;
        }

        public Criteria andPoidBetween(Integer value1, Integer value2) {
            addCriterion("poid between", value1, value2, "poid");
            return (Criteria) this;
        }

        public Criteria andPoidNotBetween(Integer value1, Integer value2) {
            addCriterion("poid not between", value1, value2, "poid");
            return (Criteria) this;
        }

        public Criteria andPonameIsNull() {
            addCriterion("poname is null");
            return (Criteria) this;
        }

        public Criteria andPonameIsNotNull() {
            addCriterion("poname is not null");
            return (Criteria) this;
        }

        public Criteria andPonameEqualTo(String value) {
            addCriterion("poname =", value, "poname");
            return (Criteria) this;
        }

        public Criteria andPonameNotEqualTo(String value) {
            addCriterion("poname <>", value, "poname");
            return (Criteria) this;
        }

        public Criteria andPonameGreaterThan(String value) {
            addCriterion("poname >", value, "poname");
            return (Criteria) this;
        }

        public Criteria andPonameGreaterThanOrEqualTo(String value) {
            addCriterion("poname >=", value, "poname");
            return (Criteria) this;
        }

        public Criteria andPonameLessThan(String value) {
            addCriterion("poname <", value, "poname");
            return (Criteria) this;
        }

        public Criteria andPonameLessThanOrEqualTo(String value) {
            addCriterion("poname <=", value, "poname");
            return (Criteria) this;
        }

        public Criteria andPonameLike(String value) {
            addCriterion("poname like", value, "poname");
            return (Criteria) this;
        }

        public Criteria andPonameNotLike(String value) {
            addCriterion("poname not like", value, "poname");
            return (Criteria) this;
        }

        public Criteria andPonameIn(List<String> values) {
            addCriterion("poname in", values, "poname");
            return (Criteria) this;
        }

        public Criteria andPonameNotIn(List<String> values) {
            addCriterion("poname not in", values, "poname");
            return (Criteria) this;
        }

        public Criteria andPonameBetween(String value1, String value2) {
            addCriterion("poname between", value1, value2, "poname");
            return (Criteria) this;
        }

        public Criteria andPonameNotBetween(String value1, String value2) {
            addCriterion("poname not between", value1, value2, "poname");
            return (Criteria) this;
        }

        public Criteria andPosalaryIsNull() {
            addCriterion("posalary is null");
            return (Criteria) this;
        }

        public Criteria andPosalaryIsNotNull() {
            addCriterion("posalary is not null");
            return (Criteria) this;
        }

        public Criteria andPosalaryEqualTo(Integer value) {
            addCriterion("posalary =", value, "posalary");
            return (Criteria) this;
        }

        public Criteria andPosalaryNotEqualTo(Integer value) {
            addCriterion("posalary <>", value, "posalary");
            return (Criteria) this;
        }

        public Criteria andPosalaryGreaterThan(Integer value) {
            addCriterion("posalary >", value, "posalary");
            return (Criteria) this;
        }

        public Criteria andPosalaryGreaterThanOrEqualTo(Integer value) {
            addCriterion("posalary >=", value, "posalary");
            return (Criteria) this;
        }

        public Criteria andPosalaryLessThan(Integer value) {
            addCriterion("posalary <", value, "posalary");
            return (Criteria) this;
        }

        public Criteria andPosalaryLessThanOrEqualTo(Integer value) {
            addCriterion("posalary <=", value, "posalary");
            return (Criteria) this;
        }

        public Criteria andPosalaryIn(List<Integer> values) {
            addCriterion("posalary in", values, "posalary");
            return (Criteria) this;
        }

        public Criteria andPosalaryNotIn(List<Integer> values) {
            addCriterion("posalary not in", values, "posalary");
            return (Criteria) this;
        }

        public Criteria andPosalaryBetween(Integer value1, Integer value2) {
            addCriterion("posalary between", value1, value2, "posalary");
            return (Criteria) this;
        }

        public Criteria andPosalaryNotBetween(Integer value1, Integer value2) {
            addCriterion("posalary not between", value1, value2, "posalary");
            return (Criteria) this;
        }

        public Criteria andIsDeleteIsNull() {
            addCriterion("isDelete is null");
            return (Criteria) this;
        }

        public Criteria andIsDeleteIsNotNull() {
            addCriterion("isDelete is not null");
            return (Criteria) this;
        }

        public Criteria andIsDeleteEqualTo(Integer value) {
            addCriterion("isDelete =", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteNotEqualTo(Integer value) {
            addCriterion("isDelete <>", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteGreaterThan(Integer value) {
            addCriterion("isDelete >", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteGreaterThanOrEqualTo(Integer value) {
            addCriterion("isDelete >=", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteLessThan(Integer value) {
            addCriterion("isDelete <", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteLessThanOrEqualTo(Integer value) {
            addCriterion("isDelete <=", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteIn(List<Integer> values) {
            addCriterion("isDelete in", values, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteNotIn(List<Integer> values) {
            addCriterion("isDelete not in", values, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteBetween(Integer value1, Integer value2) {
            addCriterion("isDelete between", value1, value2, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteNotBetween(Integer value1, Integer value2) {
            addCriterion("isDelete not between", value1, value2, "isDelete");
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