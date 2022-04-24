<template>
  <n-auto-complete
    v-model:value="value"
    :options="options"
    placeholder="Search"
    :on-update:value="$emit('searchEvent', value)"
  />
</template>

<script>
import { defineComponent, ref, computed } from "vue";
import { NAutoComplete } from 'naive-ui';

export default defineComponent({
  components: {
    NAutoComplete
  },
  props: {
    options: {
      type: Array
    }
  },
  setup(props) {
    const valueRef = ref("");

    const options = computed(() => {
      return props.options.filter(option => option.label.toLowerCase().includes(valueRef.value.toLowerCase()));
    });

    return {
      value: valueRef,
      options,
    };
  }
});
</script>
