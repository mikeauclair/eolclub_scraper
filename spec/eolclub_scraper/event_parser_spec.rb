require 'eolclub_scraper/event_parser'

describe EolclubScraper::EventParser do

  describe '#parse' do
    let(:parsed) { subject.parse(content) }

    it 'parses an Event from the supplied content' do
      expect( parsed.start_time ).to eq( Time.local(2013, 12, 9, 18, 0, 0) )
      expect( parsed.end_time ).to eq( Time.local(2013, 12, 9, 23, 0, 0) )
    end

    it 'provides the HTML description from the scraped page' do
      desc = parsed.description
      expect(desc).to include("Monthly Providence, RI hacknight.")
      expect(desc).to include("Our next meetup is")
      expect(desc).to include("@EOLclub")
    end
  end

  let(:content) {
    <<-EOF
      <!DOCTYPE html>
      <html>
      <head>
        <meta http-equiv='content-type' content='text/html; charset=utf-8' />
        <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0' />
        <title>End of Line Club // Providence, RI hacknight</title>
        <meta name='description' content='Monthly Providence, Rhode Island hacknight. Code, design, and collaborate with other local developers to a backdrop of electronic music.' />
        <link href='/stylesheets/screen.css' media='screen' rel='stylesheet' type='text/css' />
        <script type="text/javascript" src="http://use.typekit.com/vry7ulq.js"></script>
        <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
      </head>
      <body>
        <div id='container'>
          <header>
            <h1>End of Line Club</h1>
          </header>
          <section id='main'>
            <p>
              Monthly Providence, RI hacknight. Code, design, and collaborate
              with other local developers to a backdrop of electronic music.
              Bring your laptop and a project to work on.
            </p>
            <p>
              Our next meetup is
              Monday, December 9th from 6pm&ndash;11pm
              at <a href='http://basicsgroup.com'>Basics Group</a>.
              Arrive whenever you can. Pizza and beer provided.
            </p>
            <p>
              <a href="https://twitter.com/EOLclub">@EOLclub</a>
              to get more info and RSVP.
            </p>
          </section>
        </div>
        <!--
          "Up there it's their time... their time.
          But down here it's our time. It's our time down here."
          - The Goonies

          Site design and coding by David Piehler (@dpie)
        -->
      </body>
      </html>
    EOF
  }

end
