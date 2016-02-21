BUS2.SearchInput = React.createClass({
  countryAPI: '/api/v1/country/find/',
  stateAPI: '/api/v1/state/find/country_id/',
  cityAPI: '/api/v1/city/find/state_id/',

  onKeyUpHandler: function(e) {
    // var that = this,
    //     url;

    // switch (e.target.name) {
    //   case 'country':
    //     url = this.countryAPI + e.target.value;
    //     break;
    //   case 'state':
    //     // url = this.stateAPI.replace('country_id', BUS2.SearchView.getCountrySelected()) + e.target.value;
    //     break;
    //   case 'city':
    //     // url = this.cityAPI.replace('state_id', BUS2.SearchView.getStateSelected()) + e.target.value;
    //     break;
    // }

    // if (e.target.value.length > 0) {
    //   console.log(url);
    //   $.get(url, function(data) {
    //     that.setState({itens:data});
    //     that.renderList(data);
    //   });
    // } else {
    //   this.setState({itens:[]});
    //   that.renderList([]);
    // }
  },

  getInitialState: function() {
    return {
      itens: [],
      list: this.getList([])
    };
  },

  renderList: function (items) {
    this.setState({list: this.getList(items)});
  },

  getList: function (items) {
    return (
      <ul className="input-list-data hidden">
        {this.parseItems(items)}
      </ul>
    );
  },

  selectItem: function(e) {
    e.stopPropagation();

    var el = $(e.target).parents('li')[0];
    var type = el.getAttribute('type');
    var id = el.getAttribute('id');
    var value = el.getAttribute('name');

    if (this.props.clickCallback) {
      this.props.clickCallback(type, value, id);
    }

    switch (type) {
      case 'country':
        this.renderList([]);
        $('#country').val(value);
        
        break;
      case 'state':
        
        $('input#state').val(value);
        break;

      case 'city':
        break;
    }

  },

  parseItems: function (items) {
    var that = this;

    return items.map(function (item) {
      return (
        <li key={item[that.props.name].id}
            id={item[that.props.name].id}
            name={item[that.props.name].name} 
            type={that.props.name}> 
            <span>{item[that.props.name].name}</span> 
        </li>
      )
    })
  },

  render: function () {
    return (
      <div className="input-wrapper">
        <input
          autoComplete="off"
          type="text"
          placeholder={this.props.placeholder}
          className={this.props.className} 
          id={this.props.id} 
          name={this.props.name}
          value={this.props.value}
          onKeyUp={this.onKeyUpHandler} />
        {this.state.list}
      </div>

    )
  }
});
