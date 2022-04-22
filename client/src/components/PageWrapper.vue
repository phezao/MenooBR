<template>
  <div class="flex flex-col min-h-full">
    <navbar-vue />
    <div class="grow">
      <slot />
    </div>
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
