BUS2.Header = React.createClass({

  bindEvents: function() {
    var that = this;

    $(window).on('bus2::closeMenu', function() {
      that.closeMenu();
    });

    BUS2.Eventer.on('contributeClick', function () {
      that.closeSearch();
    });

    BUS2.Eventer.on('lineResultClick', function () {
      that.closeSearch();
    });
  },

  componentDidMount: function() {
    this.bindEvents();
  },

  getInitialState: function() {
    return {
      isMenuOpen: false,
      isSearchSelected: true
    };
  },

  openMenu: function() {
    if (this.state.isSearchSelected) {
      this.closeSearch();
    }

    ReactDOM.render(<BUS2.Nav />, $('.bus2-nav')[0]);
    this.setState({isMenuOpen: true});
    BUS2.mainContainer.find('.bus2-nav').addClass('on');      
    BUS2.mainContainer.find('.bus2-header').toggleClass('select-menu');
  },

  closeMenu: function() {
    this.setState({isMenuOpen: false});
    BUS2.mainContainer.find('.bus2-nav').removeClass('on');
    BUS2.mainContainer.find('.bus2-header').toggleClass('select-menu');
  },

  menuHandler: function() {
    var isMenuOpen = this.state.isMenuOpen;

    if (isMenuOpen) {
      this.closeMenu();
    } else {
      this.openMenu();
    }
  },

  openSearch: function() {
    BUS2.mainContainer.find('.bus2-header').addClass('select-search');
    this.setState({isSearchSelected:true});
    ReactDOM.render(<BUS2.SearchView />, $('.bus2-search-container')[0]);
    $('.bus2-search-container').fadeIn(300);
  },

  closeSearch: function() {
    BUS2.mainContainer.find('.bus2-header').removeClass('select-search');
    this.setState({isSearchSelected:false});
    $('.bus2-search-container').fadeOut(300);
  },

  pinAlertHandler: function() {
    if (this.state.isMenuOpen) {
      this.closeMenu();
    }
    
    if (this.state.isSearchSelected) {
      this.closeSearch();
    } else {
      this.openSearch();
    }
  },

  render: function () {
    return (
      <div>
        <a className="bus2-menu-burger" onClick={this.menuHandler}>
          <svg className="menu-burger">
            <use xlinkHref="#menu-burger"></use>
          </svg>
        </a>
        <h1>BUS2</h1>
        <a className="bus2-search" onClick={this.pinAlertHandler}>
          <svg className="search">
            <use xlinkHref="#search"></use>
          </svg>
        </a>
        <div className="bus2-triangle">
          <svg className="triangle">
            <use xlinkHref="#triangle"></use>
          </svg>
        </div>
      </div>
    )
  }
});
