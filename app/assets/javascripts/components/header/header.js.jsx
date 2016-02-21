BUS2.Header = React.createClass({

  bindEvents: function() {
    var that = this;

    $(window).on('bus2::closeMenu', function() {
      that.closeMenu();
    });
  },

  componentDidMount: function() {
    this.bindEvents();
  },

  getInitialState: function() {
    return {
      isMenuOpen: false,
      isSearchSelected: false
    };
  },

  openMenu: function() {
    if (this.state.isSearchSelected) {
      BUS2.mainContainer.find('.bus2-header').removeClass('select-search');
      this.setState({isSearchSelected:false});
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

  pinAlertHandler: function() {
    if (this.state.isMenuOpen) {
      this.closeMenu();
    }
    
    if (this.state.isSearchSelected) {
      BUS2.mainContainer.find('.bus2-header').removeClass('select-search');
      this.setState({isSearchSelected:false});
    } else {
      BUS2.mainContainer.find('.bus2-header').addClass('select-search');
      this.setState({isSearchSelected:true});
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
