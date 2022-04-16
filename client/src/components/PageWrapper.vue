<template>
  <div class="flex flex-col justify-between min-h-full">
    <navbar-vue />
    <slot />
    <footer-vue/>
  </div>
</template>

<script>
  import { defineComponent } from "vue"
  import FooterVue from "./Footer.vue";
  import NavbarVue from "./Navbar.vue";

  export default defineComponent({
    components: {
      FooterVue,
      NavbarVue
    }
  });
</script>
