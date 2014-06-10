class mdmailer
  @settings:
    defaultLanguage: "en"
    defaultFrom: "contact@engarte.com"
  @sender: Email

  @_isStringEmail: (email) ->
    emailPattern = /^([\w.-]+)@([\w.-]+)\.([a-zA-Z.]{2,6})$/i
    if email.match emailPattern then true else false

  @config: (appConfig) ->
    @settings = _.extend(@settings, appConfig)

  @send: (email, template) ->
    template.data or= {}
    throw Meteor.error("invalid email") unless @_isStringEmail email
    emailOptions =
      to: email
      from: @settings.defaultFrom
      subject: _.template(template.subject,template.data)
      html: marked(_.template(template.body, template.data))
      text: template.body

    @sender.send emailOptions

@mdmailer = mdmailer
