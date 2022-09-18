import { mapState } from 'vuex'

const baseMixin = {
  computed: {
    ...mapState({
      layout: state => state.app.layout,
      navTheme: state => state.app.theme,
      primaryColor: state => state.app.color,
      colorWeak: state => state.app.weak,
      fixedHeader: state => state.app.fixedHeader,
      fixedSidebar: state => state.app.fixedSidebar,
      contentWidth: state => state.app.contentWidth,

      isMobile: state => state.app.isMobile,
      sideCollapsed: state => state.app.sideCollapsed,
      multiTab: state => state.app.multiTab,
      hideFooter: state => state.app.hideFooter
    }),
    isTopMenu() {
      return this.layout === 'topmenu' || this.layout === 'mixmenu'
    }
  },
  methods: {
    isSideMenu() {
      return !this.isTopMenu
    }
  }
}

export { baseMixin }
