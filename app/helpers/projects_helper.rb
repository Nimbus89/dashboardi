module ProjectsHelper

	def visualisation_path( project, options={} )
		if(options.has_key?(:page_id))
			"/visualisation/#{project.id}/#{options[:page_id]}"
		else
			"/visualisation/#{project.id}"
		end

	end
end
