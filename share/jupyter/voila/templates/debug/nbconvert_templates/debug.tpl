{%- extends 'voila.tpl' -%}

{%- block body -%}

<div class="jp-RenderedHTMLCommon">Kernel Status: <span id="kernel-status"></span></div>

{{ super() }}
{%- endblock body -%}

{% block footer_js %}
{{ super() }}
<script src="{{resources.base_url}}voila/static/jquery.min.js"></script>
<script>
    {% include "util.js" %}
    requirejs(['static/voila'], (voila) => debug_init(voila));
</script>
{% endblock footer_js %}
