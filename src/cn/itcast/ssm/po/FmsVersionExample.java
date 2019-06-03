package cn.itcast.ssm.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class FmsVersionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public FmsVersionExample() {
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

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andVersionNumberIsNull() {
            addCriterion("version_number is null");
            return (Criteria) this;
        }

        public Criteria andVersionNumberIsNotNull() {
            addCriterion("version_number is not null");
            return (Criteria) this;
        }

        public Criteria andVersionNumberEqualTo(Double value) {
            addCriterion("version_number =", value, "versionNumber");
            return (Criteria) this;
        }

        public Criteria andVersionNumberNotEqualTo(Double value) {
            addCriterion("version_number <>", value, "versionNumber");
            return (Criteria) this;
        }

        public Criteria andVersionNumberGreaterThan(Double value) {
            addCriterion("version_number >", value, "versionNumber");
            return (Criteria) this;
        }

        public Criteria andVersionNumberGreaterThanOrEqualTo(Double value) {
            addCriterion("version_number >=", value, "versionNumber");
            return (Criteria) this;
        }

        public Criteria andVersionNumberLessThan(Double value) {
            addCriterion("version_number <", value, "versionNumber");
            return (Criteria) this;
        }

        public Criteria andVersionNumberLessThanOrEqualTo(Double value) {
            addCriterion("version_number <=", value, "versionNumber");
            return (Criteria) this;
        }

        public Criteria andVersionNumberIn(List<Double> values) {
            addCriterion("version_number in", values, "versionNumber");
            return (Criteria) this;
        }

        public Criteria andVersionNumberNotIn(List<Double> values) {
            addCriterion("version_number not in", values, "versionNumber");
            return (Criteria) this;
        }

        public Criteria andVersionNumberBetween(Double value1, Double value2) {
            addCriterion("version_number between", value1, value2, "versionNumber");
            return (Criteria) this;
        }

        public Criteria andVersionNumberNotBetween(Double value1, Double value2) {
            addCriterion("version_number not between", value1, value2, "versionNumber");
            return (Criteria) this;
        }

        public Criteria andVersionDateIsNull() {
            addCriterion("version_date is null");
            return (Criteria) this;
        }

        public Criteria andVersionDateIsNotNull() {
            addCriterion("version_date is not null");
            return (Criteria) this;
        }

        public Criteria andVersionDateEqualTo(Date value) {
            addCriterionForJDBCDate("version_date =", value, "versionDate");
            return (Criteria) this;
        }

        public Criteria andVersionDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("version_date <>", value, "versionDate");
            return (Criteria) this;
        }

        public Criteria andVersionDateGreaterThan(Date value) {
            addCriterionForJDBCDate("version_date >", value, "versionDate");
            return (Criteria) this;
        }

        public Criteria andVersionDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("version_date >=", value, "versionDate");
            return (Criteria) this;
        }

        public Criteria andVersionDateLessThan(Date value) {
            addCriterionForJDBCDate("version_date <", value, "versionDate");
            return (Criteria) this;
        }

        public Criteria andVersionDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("version_date <=", value, "versionDate");
            return (Criteria) this;
        }

        public Criteria andVersionDateIn(List<Date> values) {
            addCriterionForJDBCDate("version_date in", values, "versionDate");
            return (Criteria) this;
        }

        public Criteria andVersionDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("version_date not in", values, "versionDate");
            return (Criteria) this;
        }

        public Criteria andVersionDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("version_date between", value1, value2, "versionDate");
            return (Criteria) this;
        }

        public Criteria andVersionDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("version_date not between", value1, value2, "versionDate");
            return (Criteria) this;
        }

        public Criteria andVersionTypeIsNull() {
            addCriterion("version_type is null");
            return (Criteria) this;
        }

        public Criteria andVersionTypeIsNotNull() {
            addCriterion("version_type is not null");
            return (Criteria) this;
        }

        public Criteria andVersionTypeEqualTo(String value) {
            addCriterion("version_type =", value, "versionType");
            return (Criteria) this;
        }

        public Criteria andVersionTypeNotEqualTo(String value) {
            addCriterion("version_type <>", value, "versionType");
            return (Criteria) this;
        }

        public Criteria andVersionTypeGreaterThan(String value) {
            addCriterion("version_type >", value, "versionType");
            return (Criteria) this;
        }

        public Criteria andVersionTypeGreaterThanOrEqualTo(String value) {
            addCriterion("version_type >=", value, "versionType");
            return (Criteria) this;
        }

        public Criteria andVersionTypeLessThan(String value) {
            addCriterion("version_type <", value, "versionType");
            return (Criteria) this;
        }

        public Criteria andVersionTypeLessThanOrEqualTo(String value) {
            addCriterion("version_type <=", value, "versionType");
            return (Criteria) this;
        }

        public Criteria andVersionTypeLike(String value) {
            addCriterion("version_type like", value, "versionType");
            return (Criteria) this;
        }

        public Criteria andVersionTypeNotLike(String value) {
            addCriterion("version_type not like", value, "versionType");
            return (Criteria) this;
        }

        public Criteria andVersionTypeIn(List<String> values) {
            addCriterion("version_type in", values, "versionType");
            return (Criteria) this;
        }

        public Criteria andVersionTypeNotIn(List<String> values) {
            addCriterion("version_type not in", values, "versionType");
            return (Criteria) this;
        }

        public Criteria andVersionTypeBetween(String value1, String value2) {
            addCriterion("version_type between", value1, value2, "versionType");
            return (Criteria) this;
        }

        public Criteria andVersionTypeNotBetween(String value1, String value2) {
            addCriterion("version_type not between", value1, value2, "versionType");
            return (Criteria) this;
        }
    }

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