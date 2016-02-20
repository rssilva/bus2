BUS2.Header = React.createClass({
  render: function () {
    return (
      <div>
        <a href="#menu" className="bus2-menu-burger">
          <svg className="menu-burger">
            <use xlinkHref="#menu-burger"></use>            
          </svg>
        </a>
        <h1>BUS2</h1>
        <a href="#pin-alert" className="bus2-pin-alert">
          <svg className="pin-alert">
            <use xlinkHref="#pin-alert"></use>        
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
