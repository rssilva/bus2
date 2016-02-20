var Header = React.createClass({
  render: function () {
    return (
      <div>
        <a href="#menu" className="bus2-menu-burger">
          <svg className="menu-burger">
            <use xlinkHref="#menu-burger"></use>            
          </svg>
        </a>
        <h1>BUS2</h1>
      </div>
    )
  }
});
