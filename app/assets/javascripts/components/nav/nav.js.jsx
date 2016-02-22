BUS2.Nav = React.createClass({
  getInitialState: function() {
    return {
      position: 'bus2-nav-content about'
    }
  },

  navCloseHandler: function() {
    $(window).trigger('bus2::closeMenu');
    BUS2.mainContainer.find('.bus2-nav').removeClass('on');
  },

  navLinksHandler: function(event) {
    var $el = $(event.target);

    if (!$el.hasClass('select')) {
      if ($el.hasClass('about')) {
        this.setState({ position: 'bus2-nav-content about' })
      } else if ($el.hasClass('how-it-works')) {
        this.setState({ position: 'bus2-nav-content how-it-works' })
      }

      BUS2.mainContainer.find('.bus2-nav-links .about').toggleClass('select');
      BUS2.mainContainer.find('.bus2-nav-links .how-it-works').toggleClass('select');
    }
  },

  navLinkAlertHandler: function() {

  },

  render: function() {
    return (
      <div>
        <ul className="bus2-nav-links">
          <li><a className="about select" onClick={this.navLinksHandler}>A empresa</a></li>
          <li><a className="how-it-works" onClick={this.navLinksHandler}>Como funciona</a></li>
          <li><a onClick={this.navLinkAlertHandler} className="bus2-alert-btn">Bus alerta</a></li>
        </ul>

        <div className={this.state.position}>
          <div className="bus2-nav-content-about">
            <div className="text-container">
              <p>Everyday, millions of people rely on public transport.</p>
              <p>In many countries – specially Brazil – the timetables for buses are hard to find, understand, and specially, not reliable.</p>
              <p>That leads to people constantly missing their intended buses, causing many negative implications such as getting late at work and wasting precious time standing still at the bus stop – not knowing whether it will arrive in a couple of minutes or an hour.</p>
              <p>Its not hard to remember a day when you were sure about the timetable, left accordingly, just to watch on your way to the bus stop, your bus passing a few minutes ahead of schedule.</p>
              <p>Knowing that millions have that routine and leaving this problem to be solved by local government is a recipe for frustration, we decided to solve that productivity problem by using the power of collaboration, amped by technology.</p>
              <p>With BUS2 people will be able to pinpoint their intended bus location in real time and plan accordingly.</p>
              <p>It’s also possible to set up alerts that will warn you, according to your routine, when it’s time to head to the bus stop.</p>
              <p>In order for that to be possible, people who catch a bus, will collaborate by sharing in real time the location of the bus that's being used, and in exchange, being rewarded for that.</p>
              <p>As an alternative, in case there's no real time update for the bus that's being searched for, we will still present you with the official timetable. </p>
            </div>
          </div>
          <div className="bus2-nav-content-how-it-works">
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
          </div>
        </div>

        <a className="bus2-nav-close" onClick={this.navCloseHandler}>X</a>
      </div>
    )
  }
});