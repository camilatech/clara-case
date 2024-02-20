{% macro generate_schema_name(custom_schema_name, node) -%}

    {#-
        This macro will return:
        * custom schema without prefix in prod enviroment,
        * default schema in other environments
    -#}

    {%- set default_schema = target.schema -%}

    {%- if custom_schema_name is not none and target.name == 'prod' -%}

        {{ custom_schema_name | trim }}

    {%- else -%}

        {{ default_schema }}

    {%- endif -%}

{%- endmacro %}