{%- extends 'voila.tpl' -%}

{%- block html_head_css -%}
{{ super() }}
<link rel="stylesheet" type="text/css" href="{{resources.base_url}}voila/static/toolbar.css"></link>
<link rel="stylesheet" type="text/css" href="{{resources.base_url}}voila/static/override.css"></link>
{%- endblock html_head_css -%}

{%- block body -%}
{% set nb_title = nb.metadata.get('title', '') or resources['metadata']['name'] %}
{% set kernel_display_name = nb.metadata.get('kernelspec', {}).get('display_name', '') %}

<div>
    <div class="p-Widget jp-Toolbar" style="min-height: var(--jp-private-toolbar-height); height: 36px;">
        <div class="p-Widget jp-Toolbar-item">
            {{ nb_title}}
        </div>
        <div class="p-Widget jp-Toolbar-spacer jp-Toolbar-item">
        </div>
        <button id="kernel-indicator" class="jp-Dialog-button jp-mod-accept jp-mod-styled">
            <div id="kernel-indicator-label" class="jp-Dialog-buttonLabel" title=""></div>
        </button>
        <div class="p-Widget jp-KernelName jp-Toolbar-item">
            {{ kernel_display_name }}
        </div>
        <div id="kernel-activity" class="jp-Toolbar-kernelStatus jp-Toolbar-item jp-CircleIcon" title="Kernel Idle">
        </div>
    </div>
</div>

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
