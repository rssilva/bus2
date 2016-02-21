BUS2.Nav = React.createClass({
  componentDidMount: function() {
    BUS2.mainContainer.find('.bus2-nav').addClass('on');      
  },

  componentWillUnmount: function() {
    BUS2.mainContainer.find('.bus2-nav').removeClass('on');
  },

  navCloseHandler: function() {
    $(window).trigger('bus2::closeMenu');
    BUS2.mainContainer.find('.bus2-nav').removeClass('on');

    return false;
  },

  navLinksHandler: function() {
    BUS2.mainContainer.find('.bus2-nav-links .about').toggleClass('select');
    BUS2.mainContainer.find('.bus2-nav-links .how-it-works').toggleClass('select');
  },

  navLinkAlertHandler: function() {

  },

  render: function() {
    return (
      <div>
        <ul className="bus2-nav-links">
          <li><a href="#" className="about select" onClick={this.navLinksHandler}>A empresa</a></li>
          <li><a href="#" className="how-it-works" onClick={this.navLinksHandler}>Como funciona</a></li>
          <li><a href="#" onClick={this.navLinkAlertHandler} className="bus2-alert-btn">Bus alerta</a></li>
        </ul>
        <ul className="bus2-steps">
          <li>
            <div className="circle-step"></div>
            <span>Indique sua localização</span>
          </li>
          <li>
            <div className="circle-step"></div>
            <span>Localize um ou mais ônibus</span>
          </li>
          <li>
            <div className="circle-step"></div>
            <span>Colabore quando pegar seu ônibus</span>
          </li>
        </ul>
        <strong className="headline">
          Não fique mais parado esperando seu ônibus. Faça uma busca e descubra em tempo real a localização do seu ônibus.
        </strong>
        <button className="search-btn">
          Fazer uma busca
          <svg className="search">
            <use xlinkHref="#search"></use>
          </svg>
        </button>
        <a className="bus2-nav-close" onClick={this.navCloseHandler}>X</a>
      </div>
    )
  }
});