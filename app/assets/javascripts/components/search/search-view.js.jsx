BUS2.SearchView = React.createClass({
  countryAPI: '/api/v1/country/find/',
  stateAPI: '/api/v1/state/find/country_id/',
  cityAPI: '/api/v1/city/find/state_id/',
  addressAPI: '/api/v1/user/location/retrieve/sensor?lat={lat}&lon={lon}',
  linesAPI: '/api/v1/line_search/search/country_id/state_id/city_id',

  getInitialState: function() {
    return {
      items: [],
      countrySelected: null,
      stateSelected: null,
      citySelected: null,
      listCountry: this.getList('country', []),
      listState: this.getList('state', []),
      listCities: this.getList('city', []),
      linesList: [],
      linesListEl: this.getLinesEl([])
    };
  },

  searchHandler: function(event) {
    event.preventDefault();

    var inputCountry = ReactDOM.findDOMNode($('#country')[0]),
        inputState = ReactDOM.findDOMNode($('#state')[0]),
        inputCity = ReactDOM.findDOMNode($('#city')[0]);

  },

  shareGPS: function() {
    var that = this;

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position){
        that.resolveAddressUser(position.coords);
      });

    }
  },

  onKeyUpHandler: function(e) {
    var that = this,
        url;

    if (e.target.value.length > 0) {
      switch (e.target.name) {
        
        case 'country':
          url = this.countryAPI + e.target.value;

          $.get(url, function(data) {
            // console.log(data);
            that.setState({listCountry: that.getList('country', data)});
          });

          break;
        case 'state':
          url = this.stateAPI.replace('country_id', this.state.countrySelected) + e.target.value;

          $.get(url, function(data) {
            that.setState({listState: that.getList('state', data)});
          });

          break;
        case 'city':
          url = this.cityAPI.replace('state_id', this.state.stateSelected) + e.target.value;

          $.get(url, function(data) {
            that.setState({listCities: that.getList('city', data)});
          });

          break;
      }
    }
  },

  getList: function (type, items) {
    if (items.length > 0) {
      var className = "input-list-data " + type;

      return (
        <ul className={className}>
          {this.parseItems(items)}
        </ul>
      );
    } else {
      return;
    }

  },

  selectItem: function(e) {
    e.stopPropagation();
    var that = this;

    var el = $(e.target).parent()[0],
        id = el.getAttribute('id'),
        value = el.getAttribute('name'),
        elList = $(el).parent(),
        input;

    if (el.getAttribute('type') == 'country') {
      input = $('input#country');
      input.val(value);
      this.setState({listCountry: []});
      this.setState({countrySelected: id});
      
    } else if (el.getAttribute('type') == 'state') {
      input = $('input#state');
      input.val(value);
      this.setState({listState: []});
      this.setState({stateSelected: id});

    } else if (el.getAttribute('type') == 'city') {
      input = $('input#city');
      input.val(value);
      this.setState({listCities: []});
      this.setState({citySelected: id}, function() {
        that.fetchLines();
      });

    }
  },

  fetchLines: function() {
    this.getLines();
    // this.setState({linesList: this.getLines()});
  },

  getLines: function() {
    var url = this.linesAPI.replace('country_id', this.state.countrySelected).replace('state_id', this.state.stateSelected).replace('city_id', this.state.citySelected);
    var that = this;

    $.get(url, function(data){
      console.log(data);

      if (data) {
        that.onLinesData(data)
        // return (
        //   <ul className="blabla">
        //     {that.parseLines(data.hits.hits)}
        //   </ul>
        // )
      } else {
        return;
      }
    });

  },

  getLinesEl: function (data) {
    var hits = [];

    if (data && data.hits && data.hits.hits) {
      hits = data.hits.hits;
    }

    return (
      <ul className="blabla">
        {this.parseLines(hits)}
      </ul>
    )
  },

  onLinesData: function (data) {
    BUS2.Eventer.trigger('onLinesData', {linesData: data});

    this.setState({linesListEl: this.getLinesEl(data)});
  },

  lineClickHandler: function(e) {
    var el = $(e.target).parent()[0];
    var id = el.getAttribute('id');

    BUS2.Eventer.trigger('lineResultClick', {id:id, country: this.state.countrySelected, state: this.state.stateSelected, city: this.state.citySelected});
  },

  parseLines: function (items) {
    var that = this;

    return items.map(function(item){
      return (
        <li key={item._id} id={item._id} onClick={that.lineClickHandler}>
          <span>{item._source.name}</span>
        </li>
      )
    });
  },

  parseItems: function (items) {
    var that = this,
        type;

    return items.map(function (item) {

      if (item.hasOwnProperty('country')) {
        type = 'country';
      } else if (item.hasOwnProperty('state')) {
        type = 'state';
      } else if (item.hasOwnProperty('city')) {
        type = 'city';
      }

      return (
        <li key={item[type].id}
            id={item[type].id}
            name={item[type].name}
            type={type}
            onClick={that.selectItem}>
            <span>{item[type].name}</span> 
        </li>
      )
    })
  },

  render: function () {
    return (
      <div className="bus2-search-wrapper">
        <div className="bus2-searching">
          <span>BUSCANDO...</span>
        </div>

        <div className="bus2-search-not-found">
          <div className="bus2-search-not-found-wrapper">
            <span className="search-result">NENHUM ÔNIBUS ENCONTRADO</span>
            <button className="search-btn">
              Fazer uma busca
              <svg className="search">
                <use xlinkHref="#search"></use>
              </svg>
            </button>
          </div>
        </div>

        <div className="bus2-search-content">
          <h2>Find your bus</h2>
          <form action="" onSubmit={this.searchHandler}>
            <div className="input-wrapper">
              <BUS2.SearchInput className="search-input" id="country" placeholder="Selecione um país" name="country" onClick={this.onClickInput} onKeyUp={this.onKeyUpHandler} />
              { this.state.listCountry }
            </div>
            <div className="input-wrapper">
              <BUS2.SearchInput className="search-input" id="state" placeholder="Selecione um estado" name="state" onClick={this.onClickInput} onKeyUp={this.onKeyUpHandler} />
              { this.state.listState }
            </div>
            <div className="input-wrapper">
              <BUS2.SearchInput className="search-input" id="city" placeholder="Selecione uma cidade" name="city" onClick={this.onClickInput} onKeyUp={this.onKeyUpHandler} />
              { this.state.listCities }
            </div>

            <div className="lines-list">
              { this.state.linesListEl }
            </div>

            <div className="bus-line-wrapper">
              <BUS2.SearchBusLineSelect busLineNumber="343" busLineName="Ipiranga Puc" />
            </div>
          </form>
        </div>
      </div>
    )
  }
});
