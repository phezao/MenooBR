<template>
  <n-auto-complete
    v-model:value="value"
    :input-props="{
      autocomplete: 'disabled'
    }"
    :options="options"
    placeholder="Search"
  />
</template>

<script>
import { defineComponent, ref, computed } from "vue";
import { NAutoComplete } from 'naive-ui';

export default defineComponent({
  components: {
    NAutoComplete
  },
  setup() {
    const valueRef = ref("");
    return {
      value: valueRef,
      options: computed(() => {
        return ["@gmail.com", "@163.com", "@qq.com"].map((suffix) => {
          const prefix = valueRef.value.split("@")[0];
          return {
            label: prefix + suffix,
            value: prefix + suffix
          };
        });
      })
    };
  }
});
</script>
