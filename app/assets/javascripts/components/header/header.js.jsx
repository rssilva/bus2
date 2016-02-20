BUS2.Header = React.createClass({
  menuHandler: function() {
    ReactDOM.render(<BUS2.Nav />, $('.bus2-nav')[0]);
    return false;
  },

  pinAlertHandler: function() {
    BUS2.mainContainer.find('.bus2-header').toggleClass('select-search');
    return false;
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
