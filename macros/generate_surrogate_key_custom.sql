{% macro generate_surrogate_key_custom(columns) %}
    {{ dbt_utils.generate_surrogate_key(columns) }}
{% endmacro %}