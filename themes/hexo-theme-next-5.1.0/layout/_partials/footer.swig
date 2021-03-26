<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-heart"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>
</div>

{% if theme.copyright %}
<div class="powered-by">
  {{ __('footer.powered', '<a class="theme-link" href="http://beian.miit.gov.cn">苏ICP备15031601-2号</a>') }}
</div>

<div class="theme-info">
  {{ __('footer.theme') }}
  <a class="theme-link" href="http://www.backendcloud.cn">
    www.backendcloud.cn
  </a>
</div>
{% endif %}
